now = (require '../local/util').now

module.exports = (orm, db) ->
  Comment = db.define 'comment', {
    id: type: 'serial', key: true
    content: type: 'text', required: true
    posted: type: 'date', time: true
  }, {
    hooks:
      beforeValidation: -> this.posted = now()
  }, {
    validations:
      content: orm.enforce.notEmptyString 'Comment cannot be empty'
  }

  Comment.hasOne 'author', db.models.user, reverse: 'comments'
  Comment
