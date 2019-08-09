now = (require '../local/util').now

module.exports = (orm, db) ->
  UserMeta = db.define "user_meta", {
    id: type: 'serial', key: true
    biography: type: 'text'
    display_name: type: 'text', size: 64
    birthday: type: 'date', time: true
    last_active: type: 'date', time: true
  }, {
    hooks:
      beforeSave: -> this.last_active = now()
      afterCreate: (success) -> this.last_active = now() if success
  }, {
    validations:
      display_name: orm.enforce.ranges.length 0, 64, 'Display name is too long'
  }

  UserMeta
