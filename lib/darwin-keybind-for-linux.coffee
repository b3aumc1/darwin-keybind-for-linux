path = require 'path'

module.exports = DarwinKeybindForLinux =
  activate: (state) ->
    #editor = atom.workspace.getActiveTextEditor()
    #old = editor.constructor.prototype.copySelectedText
    #editor.constructor.prototype.copySelectedText = ->
    #  old()
    #  debugger
    #  @getLastSelection().autoscroll()

    linuxCson = path.join(atom.keymaps.resourcePath, 'keymaps/linux.json')
    atom.keymaps.removeBindingsFromSource(linuxCson)

    #darwinCson = path.join(atom.keymaps.resourcePath, 'keymaps/darwin.json')

    #bindings = atom.keymaps.readKeymap(darwinCson, true)
    #atom.keymaps.add(darwinCson, bindings)

    atom.setBodyPlatformClass = ->
      document.body.classList.remove('platform-linux')
      document.body.classList.add('platform-darwin')

    atom.setBodyPlatformClass()

  deactivate: ->
