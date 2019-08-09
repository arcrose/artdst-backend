module.exports = (orm, db) ->
  Collection = db.define 'collection', {
    id: type: 'serial', key: true
    name: type: 'text'
    description: type: 'text'
    is_visible: type: 'boolean'
  }, {}, {
    validations:
      name: orm.enforce.ranges.length 0, 128, 'Collection name is too long'
  }

  Collection.hasOne 'parent', db.models.project
  Collection.hasMany 'tags', db.models.tag, {}, reverse: 'describedCollections'
  Collection
