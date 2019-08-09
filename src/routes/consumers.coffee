express = require 'express'
crypto = require 'crypto'
router = express.Router()

util = require '../local/util'
config = require '../local/config'
[expects, required, success, failure] = [
  util.expects, util.required, util.success, util.failure
]

newServiceID = (length) ->
  bytes = []
  while bytes.length is 0
    try
      bytes = crypto.randomBytes length
    catch ex
      console.log "Failed to generate #{length} random bytes."
  bytes.toString 'hex'

router.get '/', (req, res) ->
  res.render 'consumer'

router.post '/apply', expects
  email: required
  certificate: required
  fullName: 'artdst consumer',
  (req, res, params) ->
    req.models.consumer.create
      full_name: params.fullName
      serviceid: newServiceID config.serviceIdLength
      pubkey: params.publicKey
      email: params.email
      accepted: false,
      (err, consumer) ->
        if err?
          res.sendSigned failure err
        else
          res.sendSigned success consumer.serviceid

router.get "/#{config.consumerDashboardAddress}", (req, res) ->
  req.models.consumer.find {}, (err, consumers) ->
    if err?
      res.render 'consumerdashboard', error: err, consumers: []
    else
      res.render 'consumerdashboard', error: null, consumers: consumers

router.post '/:id/setaccess', expects
  key: required
  allowed: required,
  (req, res, params) ->
    if params.key isnt config.consumerDashboardAddress
      res.send failure new Error 'Incorrect key'
    else
      id = do (pid = req.params.id) ->
        if typeof pid is 'string' then parseInt pid else pid
      req.models.consumer.get id, (err, consumer) ->
        if err?
          res.send failure err
        else
          consumer.accepted = params.allowed
          consumer.save (err) ->
            if err?
              res.send failure err
            else
              res.send success id

module.exports = router
