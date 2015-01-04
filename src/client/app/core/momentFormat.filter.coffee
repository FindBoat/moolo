momentFormat = ->
  (momentObj, format) ->
    if !momentObj? then return ''

    if typeof momentObj is 'string'
      moment(momentObj).format format
    else if momentObj.isValid()
      momentObj.format format
    else ''

angular
  .module 'app.core'
  .filter 'momentFormat', [momentFormat]

