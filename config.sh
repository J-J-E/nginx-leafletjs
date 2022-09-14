#/bin/bash

#retrieve variables from vars.sh
source ./vars.sh

set -e

echo "using Tile Server: $TILESERVER"
echo "attribution: $ATTRIBUTION"

cat <<HERE >/usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>${TITLE}</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css" />
  <style>
    body {
      padding: 0px;
      margin: 0px;
      height: 100%;
      width: 100%;
    }
    #map {
      width: 100%;
      height: 100%;
    }
  </style>
</head>
<body>
  <div id="map"></div>
  <script src="//cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/zepto/1.1.4/zepto.min.js"></script>
  <script src="autosize.js"></script>
  <script>
    Autosize.enable();
    var map = L.map('map').setView([${DEFAULT_LAT}, ${DEFAULT_LON}], ${DEFAULT_SCALE});
    L.tileLayer('${TILESERVER}', {
      attribution: '${ATTRIBUTION}'
    })
      .addTo(map);
  </script>
</body>
</html>
HERE

nginx -g "daemon off;"
