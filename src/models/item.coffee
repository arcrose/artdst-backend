now = (require '../local/util').now

module.exports = (orm, db) ->
  Item = db.define 'item', {
    id: type: 'serial', key: true
    index: type: 'integer', required: true
    location: type: 'text', required: true
    content_type: type: 'text', required: true
    created: type: 'date', time: true
  }, {
    hooks:
      beforeValidation: -> this.created = now()
  }, {
    validations:
      index: orm.enforce.ranges.number 0, undefined, 'Index cannot be less than zero'
      location: orm.enforce.ranges.length 4, 255, 'File path is too long or too short'
      # TODO: Replace with a test for membership of a list of accepted media types.
      cotent_type: orm.enforce.ranges.length 0, 64, 'Content type name is too long'
  }
  Item.hasOne 'parent', db.models.collection, reverse: 'items'
  Item.hasMany 'comments', db.models.comment
  Item
