notifyMethods = (require '../local/util').notifyMethods

module.exports = (orm, db) ->
  Notification = db.define 'notification', {
    id: type: 'serial', key: true
    update_method: type: 'text', required: true, size: 16
    subject: type: 'text', size: 128
    message: type: 'text', big: true
  }, {
    update_method: orm.enforce.lists.inside notifyMethods, 'Not a valid notification method'
    subject: orm.enforce.ranges.length 0, 128, 'Notification subject is too long'
    message: orm.enforce.notEmptyString 'Notification message cannot be empty'
  }

  Notification
