module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      client: 'web'
      server: 'server'

    coffee:
      client:
        files: [{src: 'src/launch.coffee', dest: 'web/launch.js'}]
      server:
        files:
          'server/main.js': 'src/main.coffee'
          'server/static-web-request-handler.js': 'src/static-web-request-handler.coffee'

    copy:
      client:
        files: [
          {src: ['vendor/**'], dest: 'web/'},
          {expand: true, cwd: 'src/', src: ['**/*.{css,html}'], dest: 'web/'}
        ]

    uglify:
      client:
        files: [{src: 'web/launch.js', dest: 'web/launch.min.js'}]

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', 'Clean & build everything', ['clean', 'coffee', 'copy', 'uglify']

