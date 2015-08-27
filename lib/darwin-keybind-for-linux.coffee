path = require 'path'

module.exports = DarwinKeybindForLinux =
  activate: (state) ->
    linuxCson = path.join(atom.keymaps.resourcePath, 'keymaps/linux.json')
    atom.keymaps.removeBindingsFromSource(linuxCson)

    atom.setBodyPlatformClass = ->
      document.body.classList.remove('platform-linux')
      document.body.classList.add('platform-darwin')

    atom.setBodyPlatformClass()

  deactivate: ->
