_ = require 'underscore'
Spine._ = require 'underscore'
Geopattern = require 'geopattern'
Datauri = require 'datauri'

fsUtils = require '../lib/fs-utils'
path = require 'path'

class Game extends Spine.Model
  @configure "Game", "filePath", "gameConsole"

  toJSON: (objects) ->
    data = {'gameConsole': @gameConsole.prefix, 'filename': @filename()}

  filename: ->
    path.basename(@filePath)

  name: ->
    path.basename(@filePath, path.extname(@filePath))

  image: ->
    if @imageExists()
      Datauri(@imagePath())
    else
      Datauri(@gameConsole.imagePath())

  imagePath: ->
    path.join(path.dirname(@filePath), 'images', "#{@name()}.png")

  imageExists: ->
    fsUtils.exists(@imagePath())

module.exports = Game
