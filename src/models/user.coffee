bcrypt = require 'bcrypt'

rounds = (require '../local/config').bcryptRounds
now = (require '../local/util').now

module.exports = (orm, db) ->
  User = db.define 'user', {
    id: type: 'serial', key: true
    username: type: 'text', size: 64
    email: type: 'text', size: 64
    password_hash: type: 'text', size: 64
    password_version: type: 'integer'
    joined: type: 'date', time: true
    is_beta: type: 'boolean', defaultValue: "false"
  }, {
    hooks:
      beforeValidation: -> this.joined = now()
  }, {
    methods:
      setPassword: (pw, cb) ->
        bcrypt.genSalt rounds, (err, salt) ->
          cb err if err?
          bcrypt.hash pw, salt, (err, hash) ->
            this.password_hash = hash.toString 'hex'
            if err? then cb err else cb null, this
      ifAuthentic: (pw, cb) =>
        bcrypt.compare pw, this.password_hash, cb
  }, {
    validations:
      username: orm.enforce.security.username expr: /[\w\d]{3,64}/, 'Invalid username'
      email: [(orm.enforce.patterns.email 'Invalid email format'),
              (orm.enforce.ranges.length 0, 64, 'Email is too long')]
      password_hash: orm.enforce.ranges.length 32, 64, 'Password hash is an inappropriate length'
  }

  User.hasMany 'statuses', db.models.status
  User.hasMany 'notifications', db.models.notification
  User
