<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/drawingmap.gs.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/geolocation.gs.js"> </script>




<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e95843617e74d0c3683cc8d8a73f71af&libraries=services,clusterer,drawing"></script>

<%--  5개 지역 페이지를 찾아 준다  그리고 클릭하면 그에 맞게 이동   --%>


<div id="map" style="margin-left:20%; margin-top:10%; margin-bottom:10%; border:2px solid deepskyblue; width:750px;height:500px;"></div>
<!-- <div id="map_canvas" style="width:100%;height:800px;"></div> -->

<div align="center" style="margin-left:20%; margin-top:10%; margin-bottom:10%; border:2px solid deepskyblue; width:750px;height:500px;">
<pre>
용산, 중곡 , 논현, 강동 , 송파
</pre>
<br>
<pre>
중곡점
서울특별시 광진구 천호대로 512 군자빌딩
02-2205-2202
</pre>
<br>
<pre>
강동점
서울특별시 강동구 천호대로 1136 (성내동 379-2)
02-470-4100
</pre>
<br>
<pre>
송파점
서울특별시 송파구 송파대로 167 테라타워B동 3층
02-400-2122
</pre>
<br>
<pre>
논현점
서울특별시 강남구 학동로 147
02-3443-1001
</pre>
<br>
<pre>
용산점
서울특별시 용산구 한강대로 23길 55
02-2012-3343
</pre>

</div>




<script type="text/javascript">





var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
    level: 8, // 지도의 확대 레벨
    mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
}; 

// 지도를 생성한다 
var map = new daum.maps.Map(mapContainer, mapOption); 

// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new daum.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


/* function myLocation(nLat, nLng) {
	

// 지도에 마커를 생성하고 표시한다
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(nLat, nLng), // 마커의 좌표
map: map // 마커를 표시할 지도 객체
});

// 마커 위에 표시할 인포윈도우를 생성한다
var infowindow = new daum.maps.InfoWindow({
content : '<div style="padding:5px;">현재 위치</div>' // 인포윈도우에 표시할 내용
});

// 인포윈도우를 지도에 표시한다
infowindow.open(map, marker);

} */




//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [   

    {  
        title: '용산점', 
        latlng: new daum.maps.LatLng( 37.529042, 126.963974 ),
        content:'용산점  서울특별시 용산구 한강대로 23길 55'
    },
    {
    	title: '중곡점', 
        latlng: new daum.maps.LatLng( 37.555999, 127.076147 ),
        content:'중곡점 서울특별시 광진구 천호대로 512 군자빌딩  '
    },
    {
        title: '논현점', 
        latlng: new daum.maps.LatLng( 37.5130004, 127.0247225 ),
        content:'논현점  서울특별시 강남구 학동로 147 '
    },
    {
        title: '강동점', 
        latlng: new daum.maps.LatLng( 37.5338541, 127.1353025 ),
        content:'강동점  서울특별시 강동구 천호대로 1136 (성내동 379-2) '
    },
    {
        title: '송파점', 
        latlng: new daum.maps.LatLng( 37.4851445, 127.1200117 ),
        content:'송파점  서울특별시 송파구 송파대로 167 테라타워B동 3층 '
    }

   
          
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    ///
       // var iwRemoveable = true;
    
    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : positions[i].content
        /* removable : iwRemoveable */
    });
    
/*     // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    /// */
    
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    

    
}




function setCenter(lat, lon ) {            
// 이동할 위도 경도 위치를 생성합니다 
var moveLatLon = new daum.maps.LatLng(lat, lon );

// 지도 중심을 이동 시킵니다
map.setCenter(moveLatLon);
}         




//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
    	
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px; align-content: center;">현재 위치 입니다</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message;  //, // 인포윈도우에 표시할 내용
       // iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
       // removable : iwRemoveable
    });
    

    
    
 // 마커에 마우스오버 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
    });
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);  
      
    
}    

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
       
    };
}






</script>

</body>
</html>