fs = require 'fs'
jwt = require 'jsonwebtoken'

config = (require './config')
alg = config.signingAlgorithm
issuer = config.serviceIssuerName

module.exports = (privateKey) ->
  privkey = fs.readFileSync privateKey
  (req, res, next) ->
    req.consumer = undefined
    # Set a method on res to sign responses with our private key before sending.
    res.sendSigned = (body) ->
      options = algorithm: alg, issuer: issuer
      options.audience = req.consumer.serviceid if req.consumer?
      token = jwt.sign body, privkey, options
      res.send token
    # Try to find the consumer sending the request and attach their
    # information to req to be used by routes.
    req.models.consumer.find req.body.issuer, (err, consumers) ->
      if not err? and consumers.length is 1
        pubkey = consumers[0].pubkey
        jwt.verify req.body.signature, pubkey, (err, decoded) ->
          if not err?
            req.consumer = consumers[0]
          next()
      else
        next()
