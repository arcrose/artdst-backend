should = require 'should'
request = require 'superagent'

consumers = require '../../routes/consumers'
config = require '../../local/config'

testing = require '../testing'

baseURL = "http://localhost:#{config.serverPort}/v1/consumers/"

testApply = (data, cb) ->
  request.post( baseURL + 'apply' ).send( data ).end (err, response) ->
    should.not.exist err
    should.exist response
    testing.decode response.res.text, (err, decoded) ->
      should.not.exist err
      should.exist decoded
      cb decoded

describe 'consumers', ->
  describe 'apply', ->
    it 'Accepts complete applications', (done) ->
      data =
        email: testing.email
        certificate: testing.certificate
        fullName: testing.fullName
      testApply data, (decoded) ->
        decoded.should.have.property 'data'
        decoded.should.not.have.property 'error'
        should( decoded.data ).be.type 'string'
        done()

    it 'Supplies a default value for full name', (done) ->
      data = email: testing.email, certificate: testing.certificate
      testApply data, (decoded) ->
        decoded.should.have.property 'data'
        decoded.should.not.have.property 'error'
        should( decoded.data ).be.type 'string'
        done()
    
    it 'Expects the email field', (done) ->
      data = email: testing.email
      testApply data, (decoded) ->
        decoded.should.not.have.property 'data'
        decoded.should.have.property 'error'
        done()
    
    it 'Expects the certificate field', (done) ->
      data = certificate: testing.certificate
      testApply data, (decoded) ->
        decoded.should.not.have.property 'data'
        decoded.should.have.property 'error'
        done()
