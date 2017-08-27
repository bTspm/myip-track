ipLocation = (function () {
    function initMap(lat, lon){
        handler = Gmaps.build('Google');
        handler.buildMap({ provider: {}, internal: {id: 'map_div'}}, function(){
            markers = handler.addMarkers([
                {
                    "lat": lat,
                    "lng": lon
                }
            ]);
            handler.bounds.extendWith(markers);
            handler.fitMapToBounds();
        });
    }

    return {
        initMap: initMap
    }
})();


