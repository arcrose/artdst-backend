util = require '../local/util'
now = util.now
notifyMethods = util.notifyMethods

module.exports = (orm, db) ->
  Subscription = db.define 'subscription', {
    id: type: 'serial', key: true
    update_method: type: 'text', size: 16
    expires: type: 'date', time: true, required: true
  }, {
    methods:
      isExpired: => this.expires <= now()
  }, {
    validations:
      update_method: orm.enforce.lists.inside notifyMethods, 'Not a valid notification method'
  }
  
  Subscription.hasOne 'owner', db.models.user, reverse: 'subscriptions'
  Subscription.hasOne 'project', db.models.project
  Subscription
