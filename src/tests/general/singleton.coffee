should = require 'should'

class Required
  constructor: ->
    if not @instance?
      @instance = this
    else
      throw new Error 'Cannot make more than one Required instance'

required = new Required
randomObject = {a: 1, b: 2}

required.should.be.ok
(-> req2 = new Required).should.throw
required.should.equal required
required.should.not.equal randomObject
required.should.be.exactly required
required.should.not.be.exactly randomObject
