now = (require '../local/util').now

module.exports = (orm, db) ->
  Token = db.define 'token', {
    id: type: 'serial', key: true
    token_string: type: 'text', size: 64
    created: type: 'date', time: true
    expires: type: 'date', time: true
  }, {
    methods:
      isExpired: => this.expires <= now()
  }, {
    hooks:
      beforeValidation: -> this.created = now()
  }, {
    validations:
      token_string: orm.enforce.ranges.length 0, 64, 'Token is too long'
  }

  Token.hasOne 'user', db.models.user, reverse: 'tokens'
  Token.hasOne 'owner', db.models.consumer, reverse: 'tokens'
  Token
