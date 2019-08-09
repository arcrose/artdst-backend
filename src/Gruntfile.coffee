tests = require './runtests'

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffeelint:
      app: ['*.coffee', 'local/*.coffee', 'tests/**/*.coffee', 'routes/*.coffee', 'client/*.coffee']
      options:
        camel_case_classes:
          level: 'error'
        line_endings:
          level: 'error'
          value: 'unix'
        max_line_length:
          level: 'error'
          value: 100
        no_plusplus:
          level: 'error'
        prefer_english_operator:
          level: 'warn'
    coffee_jshint:
      options:
        jshintOptions: ['unused', 'camelcase', 'plusplus']
    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: 'should' #'coffee-script/register'
        src: ['tests/**/*.coffee']
    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: 'client/'
        src: ['*.coffee']
        dest: 'public/js/'
        ext: '.js'

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-coffee-jshint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.registerTask 'default', ['coffeelint', 'coffee_jshint', 'mochaTest', 'coffee']
