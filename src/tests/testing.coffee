fs = require 'fs'
crypto = require 'crypto'
jwt = require 'jsonwebtoken'

config = require '../local/config'

certificate = fs.readFileSync './tests/cert.pem'
artdstKey = fs.readFileSync './secrets/cert.pem'

module.exports =
  email: 'testing@email.com'
  certificate: certificate
  fullName: 'Artdst Automated Testing'
  password: '123456PA55w{}rd'
  referrer: 'artdst.com'
  callbackURL: 'artdst.com/callback'
  decode: (data, cb) ->
    jwt.verify data, artdstKey, issuer: config.serviceIssuerName, (err, dec) ->
      cb err, dec
  username: ->
    uname = null
    while not uname?
      try
        buf = crypto.pseudoRandomBytes 32
        uname = buf.toString 'hex'
      catch ex
        continue
    uname
