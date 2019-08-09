should = require 'should'
request = require 'superagent'

auth = require '../../routes/auth'
config = require '../../local/config'
testing = require '../testing'

baseURL = "http://localhost:#{config.serverPort}/v1/auth/"

testPost = (url) -> (data, cb) ->
  request.post( url ).send( data ).end (err, response) ->
    should.not.exist err
    should.exist response
    testing.decode response.res.text, (err, decoded) ->
      should.not.exist err
      should.exist decoded
      cb decoded

testRegister = testPost baseURL + 'register'
testLogin = testPost baseURL + 'login'

testRequiredField = (data, tester) ->
  tester data, (decoded) ->
    decoded.should.not.have.property 'data'
    decoded.should.have.property 'error'
    should( decoded.success ).be.false

describe 'auth', ->
  describe 'register', ->
    it 'Creates users when the required fields are provided', (done) ->
      data =
        username: testing.username()
        email: testing.email
        password: testing.password
      testRegister data, (decoded) ->
        decoded.success.should.be.true
        decoded.should.have.property 'data'
        decoded.should.not.have.property 'error'
        decoded.data.should.have.property 'message'
        decoded.data.message.should.be.type 'string'
        decoded.should.not.have.property 'error'
        done()
   
    it 'Returns back the referrer and callbackURL provided', (done) ->
      data =
        username: testing.username()
        email: testing.email
        password: testing.password
        referrer: testing.referrer
        callbackURL: testing.callbackURL
      testRegister data, (decoded) ->
        decoded.should.have.property 'data'
        decoded.should.not.have.property 'error'
        decoded.data.should.have.property 'message'
        decoded.data.message.should.be.type 'string'
        decoded.data.should.not.have.property 'error'
        decoded.data.should.have.property 'referrer'
        decoded.data.should.have.property 'callbackURL'
        decoded.data.referrer.should.equal testing.referrer
        decoded.data.callbackURL.should.equal testing.callbackURL
        done()

    it 'Expects the username field', (done) ->
      data = password: testing.password, email: testing.email
      testRequiredField data, testRegister
      done()
    
    it 'Expects the password field', (done) ->
      data = username: testing.username(), email: testing.email
      testRequiredField data, testRegister
      done()
    
    it 'Expects the email field', (done) ->
      data = username: testing.username(), password: testing.password
      testRequiredField data, testRegister
      done()
  
  describe 'login', ->
    it 'Expects the username field', (done) ->
      data =
        password: testing.password
        referrer: testing.referrer
        callbackURL: testing.callbackURL
      testRequiredField data, testLogin
      done()
    
    it 'Expects the password field', (done) ->
      data =
        username: testing.username()
        referrer: testing.referrer
        callbackURL: testing.callbackURL
      testRequiredField data, testLogin
      done()
    
    it 'Expects the referrer field', (done) ->
      data =
        username: testing.username()
        password: testing.password
        callbackURL: testing.callbackURL
      testRequiredField data, testLogin
      done()
    
    it 'Expects the callbackURL field', (done) ->
      data =
        username: testing.username()
        password: testing.password
        referrer: testing.referrer
      testRequiredField data, testLogin
      done()
