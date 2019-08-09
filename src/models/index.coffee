orm = require 'orm'

models =
  category: require './category'
  collection: require './collection'
  comment: require './comment'
  consumer: require './consumer'
  item: require './item'
  milestone: require './milestone'
  notification: require './notification'
  project: require './project'
  status: require './status'
  subscription: require './subscription'
  tag: require './tag'
  token: require './token'
  user: require './user'
  usermeta: require './usermeta'


connection = null

module.exports = (dbstr) ->
  (req, res, next) ->
    if not connection?
      orm.connect dbstr, (err, db) ->
        if err?
          console.log 'Could not initialize database connection', err
          return
        (Object.keys models).forEach (m) -> models[m] = models[m] orm, db
        db.sync ->
        console.log "Initialized DB connection to #{dbstr} and initialized models"
        connection = db
        req.models = models
        req.db = connection
        next()
    else
      req.models = models
      req.db = connection
      next()
