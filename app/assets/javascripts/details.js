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

asyncDetails = (function (){
    function init(ip){
        $(window).load(function() {
            proxyDetails(ip);
        });
    }

    function proxyDetails(ip) {
        $.ajax({
            url: "/home/proxy_details",
            data: {search_query: ip},
            contentType: "text/javascript"
        });
    }
    return {
        init: init,
        proxyDetails: proxyDetails
    }
})();