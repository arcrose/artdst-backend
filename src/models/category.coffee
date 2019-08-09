module.exports = (orm, db) ->
  Category = db.define 'category', {
    id: type: 'serial', key: true
    name: type: 'text', required: true, size: 64
  }, {
    validations:
      name: orm.enforce.ranges.length 0, 64, 'Category name is too long'
  }

  Category
