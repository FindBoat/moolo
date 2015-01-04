geoService = ($q, geolocation) ->
  # Returns a promise of {city: 'city', state: 'state'}.
  getCityState = ->
    deferred = $q.defer()

    geolocation.getLocation().then (data) ->
      lat = data.coords.latitude
      lng = data.coords.longitude

      # Fetch from Google Map API.
      latlng = new google.maps.LatLng lat, lng
      geocoder = new google.maps.Geocoder()
      geocoder.geocode 'latLng': latlng, (results, status) ->
        if status is google.maps.GeocoderStatus.OK
          for res in results
            if res.types[0] is 'locality'
              city = res.address_components[0].short_name
              state = res.address_components[2].short_name
              deferred.resolve {city: city, state: state}

        deferred.reject results
    , (err) ->
      deferred.reject err

    return deferred.promise

  service =
    getCityState: getCityState
  return service

geoService.$inject = ['$q', 'geolocation']

angular
  .module 'app.core'
  .factory 'geoService', geoService
