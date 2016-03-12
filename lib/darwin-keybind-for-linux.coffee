path = require 'path'
{TextEditor} = require 'atom'

module.exports = DarwinKeybindForLinux =
  activate: (state) ->
    linuxCson = path.join(atom.keymaps.resourcePath, 'keymaps/linux.json')
    atom.keymaps.removeBindingsFromSource(linuxCson)

    atom.setBodyPlatformClass = ->
      document.body.classList.remove('platform-linux')
      document.body.classList.add('platform-darwin')

    atom.setBodyPlatformClass()

    patch = (editor, functionName) ->
      originalFunction = editor[functionName]

      editor[functionName] = (params...) ->
        atom.views.getView(@).component.domNode.blur()

        process.nextTick =>
          originalFunction.call(@, params...)

    [
      'copySelectedText'
      'pasteText'
      'cutSelectedText'
    ].forEach (func) ->
      patch(TextEditor.prototype, func)

  deactivate: ->
