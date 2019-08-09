express = require 'express'
router = express.Router()

# GET home page.
router.get '/', (req, res) ->
  console.log 'In index handler'
  res.render 'index',
    referrer: req.get 'Referrer'

module.exports = router
