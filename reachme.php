<!DOCTYPE html>
<html>
  <head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>
      Blog
    </title>
    <script>
      function preview()
      {
        //object to define properties of map
        var mapproperty =
        {
          //center: LatLng defines latitude and longtitude of center of map
          center:new google.maps.LatLng(28.6143845,77.3587834),
          //zoom starts from 0 (whole earth) and zooms in with increasing value
          zoom:16,
          //4 types of map- ROADMAP, SATELLITE, HYBRID, TERRAIN
          mapTypeId:google.maps.MapTypeId.ROADMAP
        };
        //object to create a new map in div with id "college"
          var map = new google.maps.Map(document.getElementById("college"),mapproperty);
      } 
      function load()
      { 
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyD6YMawC9G-GGd1k276XmGibZBxcmscYns&callback=preview";
        document.body.appendChild(script);
      }   
      window.onload = load;
    </script> 
  </head>
  <body>
    <header>

    </header>
    <section>
      <div id="college" style="width:100px;height:30px;">
      </div>
    </section>
    <footer>
      
    </footer>
      <!--Import jQuery before materialize.js-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
  </body>
</html>