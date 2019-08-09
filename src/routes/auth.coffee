express = require 'express'
router = express.Router()
bcrypt = require 'bcrypt'
jwt = require 'jsonwebtoken'
request = require 'superagent'
crypto = require 'crypto'

config = require '../local/config'
util = require '../local/util'

pwver = config.passwordVersion
[required, expects, success, failure] = [util.required, util.expects, util.success, util.failure]
servErrMsg = 'A server error occurred. Please try again.'
usernameTakenMsg = 'That username is already taken.'
invalidCreds = 'The credentials you provided are invalid.'
registerSuccess = 'Your account has been created. Please log in to confirm.'

hashPassword = (pw, rounds, cb) ->
  bcrypt.genSalt rounds, (err, salt) ->
    if err? then cb err else bcrypt.hash pw, salt, (err, hash) ->
      if err? then cb err else cb null, hash.toString 'hex'

newToken = (length) ->
  token = null
  while not token?
    try
      buf = crypto.randomBytes length
      token = buf.toString 'base64'
    catch ex
      continue
  token

getTokenForUser = (req, user, cb) ->
  found = false
  for token in user.tokens
    if token.owner.serviceid is req.body.issuer
      found = true
      cb null, token
      break
  if not found
    req.models.consumer.find serviceid: req.body.issuer, (err, consumers) ->
      if err?
        cb err
      else
        consumer = consumers[0]
        req.models.token.create token_string: newToken config.tokenLength, (err, token) ->
          if err?
            cb err
          else
            token.user = user
            token.owner = consumer
            cb null, token

sendSigned = (url, data, cb) ->
  privkey = fs.readFileSync ('../' + config.privateKeyPath)
  opts = algorithm: config.signingAlgorithm, issuer: config.serviceIssuerName
  token = jwt.sign data, privkey, opts
  request.post(url).send(token).end(cb)

router.post '/register', expects
  username: required
  password: required
  email: required
  referrer: '/'
  callbackURL: '/',
  (req, res, params) ->
    responseData =
      referrer: params.referrer
      error: usernameTakenMsg
      callbackURL: params.callbackURL
    req.models.user.find username: params.username, (err, users) ->
      if err?
        responseData.error = servErrMsg
        res.sendSigned failure responseData
      else if users.length is 0
        hashPassword params.password, config.bcryptRounds, (err, hash) ->
          if err?
            responseData.error = servErrMsg
            res.sendSigned failure responseData
          else
            req.models.user.create {
              username: params.username, email: params.email,
              password_hash: hash, password_version: pwver},
              (err, user) ->
                if not err?
                  responseData.message = registerSuccess
                  delete responseData.error
                  req.db.sync ->
                    res.sendSigned success responseData
                else
                  res.sendSigned failure responseData
      else
        res.sendSigned failure responseData

router.post '/login', expects
  username: required
  password: required
  referrer: required
  callbackURL: required,
  (req, res, params) ->
    req.models.user.find username: params.username, (err, users) ->
      if err?
        res.sendSigned referrer: params.referrer, error: servErrMsg
      else
        user = users[0]
        bcrypt.compare params.password, user.password_hash, (err, matched) ->
          if err?
            res.sendSigned referrer: params.referrer, error: servErrMsg
          else if not matched
            res.sendSigned referrer: params.referrer, error: invalidCreds
          else
            getTokenForUser req, user, (err, token) ->
              sendSigned params.callbackURL, token, (response) ->
                res.sendSigned referrer: params.referrer, response: response

module.exports = router
