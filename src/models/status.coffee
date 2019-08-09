now = (require '../local/util').now

module.exports = (orm, db) ->
  Status = db.define 'status', {
    id: type: 'serial', key: true
    title: type: 'text', size: 128
    content: type: 'text', required: true, big: true
    posted: type: 'date', time: true
  }, {
    hooks:
      beforeValidation: -> this.posted = now()
  }, {
    validations:
      title: orm.enforce.ranges.length 0, 128, 'Status title is too long'
  }
  
  Status.hasOne 'share', db.models.project, reverse: 'mentioning'
  Status
