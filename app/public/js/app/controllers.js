function BeerFormCtrl($scope, $http) {
  $scope.init = function(){
    navigator.geolocation.getCurrentPosition(get_location);
  };

  get_location = function(position){
    $scope.lat  = position.coords.latitude;
    $scope.long = position.coords.longitude;
    $scope.$apply();

    // Move this shit somewhere !!!! <(0, o)>
    create_map($scope.lat, $scope.long);
    get_bars($scope.lat, $scope.long);
  };

  create_map = function(lat, long){
    /*Create an object for options*/ 
    var options={
      elt:document.getElementById('map'),       /*ID of element on the page where you want the map added*/ 
      zoom:18,                                  /*initial zoom level of the map*/ 
      latLng:{lat:lat, lng:long},   /*center of map in latitude/longitude */ 
      mtype:'osm',                              /*map type (osm)*/ 
      bestFitMargin:0,                          /*margin offset from the map viewport when applying a bestfit on shapes*/ 
      zoomOnDoubleClick:true                    /*zoom in when double-clicking on map*/ 
    };

    /*Construct an instance of MQA.TileMap with the options object*/ 
    $scope.map = new MQA.TileMap(options);
    var me = new MQA.Poi( {lat:lat, lng:long} );

    me.setIcon(new MQA.Icon("/img/marker/me.png",25,25));
    /*This will add the POI to the map in the map's default shape collection.*/ 
    $scope.map.addShape(me);

    MQA.withModule('largezoom', function() {
      $scope.map.addControl(
        new MQA.LargeZoom(),
        new MQA.MapCornerPlacement(MQA.MapCorner.TOP_LEFT, new MQA.Size(5,5))
      );
    });
  };

  get_bars = function(lat, long){
    $http({
      method: "GET",
      url: "/bars",
      data: {
        lat: lat,
        long: long
      }
    }).success(function(data, status, headers, config){
      angular.forEach(data, function(value, key){
        beer = new MQA.Poi( {lat:value.lat, lng:value.long} );
        beer.setIcon(new MQA.Icon("/img/marker/beer.png",25,25));
        $scope.map.addShape(beer);
      });
    }).error(function(data, status, headers, config){
      console.log('FUCK');  
    });
  };
};