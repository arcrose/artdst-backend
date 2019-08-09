now = (require '../local/util').now

module.exports = (orm, db) ->
  Project = db.define 'project', {
    id: type: 'serial', key: true
    name: type: 'text', required: true, size: 128
    description: type: 'text', big: true
    rating: type: 'number', defaultValue: '0.0'
    num_raters: type: 'integer', defaultValue: '0'
    created: type: 'date', time: true
    monthly_fee: type: 'number', required: true
    is_fee_optional: type: 'boolean', required: true
    is_visible: type: 'boolean', defaultValue: 'true'
  }, {
    methods:
      addRating: (score) =>
        if score < 0.0 or score > 5.0
          new Error 'A score cannot be less than zero or greater than five'
        else
          n = this.num_raters
          this.rating = ((n * this.rating) + score) / (n + 1)
          this.num_raters += 1
          this.rating
  }, {
    hooks:
      beforeValidation: -> this.created = now()
  }, {
    validations:
      name: orm.enforce.ranges.length 0, 128, 'Project name is too long'
      description: orm.enforce.notEmptyString 'Project description cannot be empty'
      rating: orm.enforce.ranges.number 0.0, 5.0, 'Project rating is outside of allowed range'
      num_raters: orm.enforce.ranges.number(0, undefined,
        'Cannot have less than zero people rate a project')
      monthly_fee: orm.enforce.ranges.number(0, undefined,
        'Cannot charge less than zero dollars for a subscription')
  }

  Project.hasOne 'owner', db.models.user, reverse: 'projects'
  Project.hasOne 'categorization', db.models.category, reverse: 'containedProjects'
  Project.hasMany 'tags', db.models.tag, {}, reverse: 'describedProjects'
  Project.hasMany 'collections', db.models.collection
  Project
