utils = ->
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

  service =
    sample: sample
  return service

angular
  .module 'app.core'
  .factory 'utils', utils

      
