express = require 'express'
path = require 'path'
logger = require 'morgan'
orm = require 'orm'
bodyParser = require 'body-parser'

# Resource route handlers
## Route modules export an initializer function that takes a database
## connection as input and returns the actual router.
routes = require './routes/index'
auth = require './routes/auth'
users = require './routes/users'
projects = require './routes/projects'
categories = require './routes/categories'
collections = require './routes/collections'
items = require './routes/items'
comments = require './routes/comments'
milestones = require './routes/milestones'
subscriptions = require './routes/subscriptions'
tags = require './routes/tags'
consumers = require './routes/consumers'

# Local requirements
config = require './local/config'

models = require './models'
webtokens = require './local/webtokens'

app = express()

app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'ejs'
app.use express.static path.join __dirname, 'public'

if process.env.NODE_ENV is 'production'
  app.use models config.dbConnString
else if process.env.NODE_ENV is 'drone'
  app.use models config.droneDBConnString
else
  app.use models config.testingDBConnString

app.use webtokens config.privateKeyPath

# route handlers

## Registration and authentication page request handlers.
app.use '/', routes
app.use '/v1/auth', auth

## Resource API general/aspect/action handlers.
app.use '/v1/users', users
app.use '/v1/projects', projects
app.use '/v1/categories', categories
app.use '/v1/collections', collections
app.use '/v1/items', items
app.use '/v1/comments', comments
app.use '/v1/milestones', milestones
app.use '/v1/subscriptions', subscriptions
app.use '/v1/tags', tags
app.use '/v1/consumers', consumers

# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err

# error handlers

# development error handler
# will print stacktrace
if app.get('env') is 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.sendSigned
      success: false
      error: JSON.stringify err

app.use (err, req, res, next) ->
  if res.status is 404
    res.sendSigned
      success: false
      error: '404 not found'

module.exports = app
app.listen config.serverPort, -> console.log 'Listening on port 8080'
