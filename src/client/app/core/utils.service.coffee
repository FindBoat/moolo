utils = ($sce) ->
  sample = (arr, size) ->
    shuffled = arr.slice 0
    i = arr.length
    min = i - size

    while i-- > min
      index = Math.floor (i + 1) * Math.random()
      temp = shuffled[index]
      shuffled[index] = shuffled[i]
      shuffled[i] = temp

    shuffled.slice min

  nl2br = (data) ->
    if not data? then return data
    return $sce.trustAsHtml '<p>' + data.replace(/\n\r?/g, '<br />') + '</p>'

  service =
    sample: sample
    nl2br: nl2br
  return service

utils.$inject = ['$sce']

angular
  .module 'app.core'
  .factory 'utils', utils

      
