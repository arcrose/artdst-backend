express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
  console.log req
  res.send 'Hello!'

module.exports = router
