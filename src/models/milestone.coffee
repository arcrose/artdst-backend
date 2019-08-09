now = (require '../local/util').now

module.exports = (orm, db) ->
  Milestone = db.define 'milestone', {
    id: type: 'serial', key: true
    goal: type: 'number', required: true
    earned: type: 'number', required: true
    description: type: 'text', big: true
    created: type: 'date', time: true
  }, {
    methods:
      isComplete: =>
        this.earned >= this.goal
  }, {
    hooks:
      beforeValidation: -> this.created = now()
  }, {
    validations:
      goal: orm.enforce.ranges.number 0.0, undefined, 'Goal cannot be less than zero dollars'
      earned: orm.enforce.ranges.number(0.0, undefined,
        'Earned value cannot be less than zero dollars')
      description: orm.enforce.notEmptyString 'Milestone description cannot be empty'
  }

  Milestone.hasOne 'owner', db.models.user, reverse: 'milestones'
  Milestone
