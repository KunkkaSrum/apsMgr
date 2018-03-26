<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/3/22
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="map_canvas1"
     style="margin-top:10px;width: 800px;height: 500px;background-color: #00AA88"></div>
</div>
<script type="text/javascript" src="<%=basePath%>mapfiles/mapapi.js"></script>
<script type="text/javascript" src="../../../js/util/jquery-1.11.3.min.js"></script>
<%--<script type="text/javascript" src="<%=basePath%>js/layer.js"></script>--%>
<script>
    var markerIcon = "images/locate.png";
    var region = "";

    <%--function getUser() {--%>
        <%--var user = null;--%>
        <%--$.ajax({--%>
            <%--type: 'POST',--%>
            <%--url: '<%=basePath%>common/user',--%>
            <%--async: false,--%>
            <%--success: function (result) {--%>
                <%--user = result;--%>
            <%--},--%>
            <%--error: function (e) {--%>
                <%--alert("error" + e);--%>
            <%--}--%>
        <%--});--%>
        <%--return user;--%>
    <%--}--%>
    <%--region = "region_"+getUser().region_type;--%>

    //加载本地瓦片图层
    function LocalMapType() {
        LocalMapType.prototype.tileSize = new google.maps.Size(256, 256);
        LocalMapType.prototype.maxZoom = 5;   //地图显示最大级别
        LocalMapType.prototype.minZoom = 3;    //地图显示最小级别
        LocalMapType.prototype.getTile = function (coord, zoom, ownerDocument) {
            var img = ownerDocument.createElement("img");
            img.style.width = this.tileSize.width + "px";
            img.style.height = this.tileSize.height + "px";
            //地图存放路径
            //谷歌矢量图 maptile/googlemaps/roadmap
            //谷歌影像图 maptile/googlemaps/roadmap
            //MapABC地图 maptile/mapabc/
            //strURL = "maptile/googlemaps/roadmap/";

            var mapPicDir = "maptile/googlemaps/roadmap/region_1/";
            var curSize = Math.pow(2, zoom);
            var strURL = mapPicDir + zoom + "/" + (coord.x % curSize ) + "/" + (coord.y % curSize) + ".jpg";
            //strURL = "E:/地图文件/谷歌地图中国0-12级googlemaps/googlemaps/roadmap/" + zoom + "/" + (coord.x % curSize )+ "/" + (coord.y % curSize)+ ".PNG";
            img.src = strURL;
            return img;
        };
    }
    //创建一个本地地图对象
    var localMapType = new LocalMapType();

    //地图初始化
    function initialize() {
        var mapOptions = {
            zoom: 3,
            center: {lat: 37.2130432088809, lng: 89.64265625},
            mapTypeControlOptions: {
                mapTypeIds: [
                    google.maps.MapTypeId.ROADMAP,
                    google.maps.MapTypeId.HYBRID,
                    google.maps.MapTypeId.SATELLITE,
                    google.maps.MapTypeId.TERRAIN,
                    'localMap']  //定义地图类型
            },
            panControl: true,
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: true,
            streetViewControl: true,
            overviewMapControl: true
        };
        map = new google.maps.Map(document.getElementById('map_canvas1'), mapOptions);
        map.mapTypes.set('localMap', localMapType);   //绑定本地地图类型
        map.setMapTypeId('localMap');    //指定显示本地地图
        map.setOptions({draggable: true});

        //地图显示范围
        var mapRangeBound = new google.maps.LatLngBounds(
            new google.maps.LatLng(4.21, 35.419),
            new google.maps.LatLng(60.50, 146.6)
        );

        //鼠标右击显示经纬度
        google.maps.event.addListener(map, "rightclick", function (event) {
            var lat = event.latLng.lat();
            var lng = event.latLng.lng();
            // 经纬度
            alert("纬度=" + lat + "; 经度=" + lng);
        });


        //限制地图显示范围
        google.maps.event.addListener(map, 'bounds_changed', function () {
            checkMapBounds(map, mapRangeBound);
        });
        marker = new google.maps.Marker({
            position: {lat: -33, lng: -109},
            map: map,
            icon: markerIcon,
            title: '在这里'
        });
    }

    //限制地图显示范围
    function checkMapBounds(map, mapRange) {
        if (map) {
            if (mapRange.contains(map.getCenter())) {
                return;
            }

            var center = map.getCenter();
            var centerX = center.lng();
            var centerY = center.lat();

            var maxX = mapRange.getNorthEast().lng();
            var maxY = mapRange.getNorthEast().lat();
            var minX = mapRange.getSouthWest().lng();
            var minY = mapRange.getSouthWest().lat();

            if (centerX < minX) {
                centerX = minX;
            }
            if (centerX > maxX) {
                centerX = maxX;
            }
            if (centerY < minY) {
                centerY = minY;
            }
            if (centerY > maxY) {
                centerY = maxY;
            }
            map.panTo(new google.maps.LatLng(centerY, centerX));
        }
    }

    google.maps.event.addDomListener(window, 'load', initialize());
</script>
</body>
</html>
