Mocha = require 'mocha'
fs = require 'fs'
path = require 'path'

mocha = new Mocha

testDir = './tests'

# Add test files to the set mocha should run.
(fs.readdirSync(testDir).filter (name) ->
  (name.slice -7) is '.coffee').forEach (file) ->
  mocha.addFile path.join testDir, file

exports.run = ->
  mocha.run (failures) ->
    process.on 'exit', ->
      process.exit failures
