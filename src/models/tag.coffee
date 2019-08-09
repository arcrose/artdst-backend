module.exports = (orm, db) ->
  Tag = db.define 'tag', {
    id: type: 'serial', key: true
    name: type: 'text', size: 32, required: true
  }, {
    validations:
      name: orm.enforce.ranges.length 0, 32, 'Tag name is too long'
  }

  Tag
