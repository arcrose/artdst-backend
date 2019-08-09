class RequiredSingleton
  constructor: ->
    if not @instance?
      @instance = this
    else
      throw Error 'Cannot create more than one instance of Required'

required = new RequiredSingleton

missingParameter = (name) ->
  if name is 'token'
    success: false, error: 'A token is required for privileged actions.'
  else
    success: false, error: "Missing required parameter #{name}."

module.exports =
  now: ->
    (new Date).toUTCString()

  notifyMethods: ['email', 'notification', 'both']

  any: (ls) ->
    for truthValue in ls
      if truthValue
        return true
    false

  all: (ls) ->
    for truthValue in ls
      if not truthValue
        return false
    true

  required: required

  expects: (paramap, cb) ->
    handler = (req, res) ->
      params = {}
      for key, val of paramap
        if paramap[key] is required
          if not req.body[key]?
            res.sendSigned missingParameter key
            return
        if req.body[key]?
          params[key] = req.body[key]
        else
          params[key] = paramap[key]
      cb req, res, params
    handler

  success: (data) ->
    return success: true, data: data

  failure: (error) ->
    return success: false, error: error
