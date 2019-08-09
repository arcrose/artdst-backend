now = (require '../local/util').now

module.exports = (orm, db) ->
  Consumer = db.define 'consumer', {
    id: type: 'serial', key: true
    full_name: type: 'text', size: 64, defaultValue: 'artdst consumer'
    serviceid: type: 'text', size: 64
    pubkey: type: 'text', big: true
    email: type: 'text', size: 64
    accepted: type: 'boolean', defaultValue: 'false'
    joined: type: 'date', time: true
  }, {
    hooks:
      beforeValidation: -> this.joined = now()
  }, {
    validations:
      full_name: orm.enforce.ranges.length 0, 64, 'Full Name is too long'
      serviceid: orm.enforce.ranges.length 0, 64, 'Service ID is too long'
      email: orm.enforce.patterns.email 'Contact email is invalid'
  }

  Consumer
