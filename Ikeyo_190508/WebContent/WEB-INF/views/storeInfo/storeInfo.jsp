<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>




<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e95843617e74d0c3683cc8d8a73f71af&libraries=services,clusterer,drawing"></script>

<%--  지역구 선택해서 각각 매장 보이게 마킹 누를때마다 변환을 주기위해  onchange나 onclick으로 처리해야함  
	   ajax로  위도, 경도 값을  넘겨주고   세팅해준다  !!! 마커는 ?? --%>


<div id="map" style="margin-left:20%; margin-top:10%; margin-bottom:10%; width:750px;height:500px;"></div>












<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.56635, 126.98068), // 지도의 중심좌표
    level: 2, // 지도의 확대 레벨
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

// 마커 이미지의 주소
var markerImageUrl = './image/location.png', 
    markerImageSize = new daum.maps.Size(40, 42), // 마커 이미지의 크기
    markerImageOptions = { 
        offset : new daum.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
    };

// 마커 이미지를 생성한다
var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

// 지도에 마커를 생성하고 표시한다
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.56682, 126.97865), // 마커의 좌표
    image : markerImage, // 마커의 이미지
    map: map // 마커를 표시할 지도 객체
});

// 마커 위에 표시할 인포윈도우를 생성한다
var infowindow = new daum.maps.InfoWindow({
content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
});

// 인포윈도우를 지도에 표시한다
infowindow.open(map, marker);

// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
daum.maps.event.addListener(marker, 'click', function() {
alert('마커를 클릭했습니다!');
});






</script>

</body>
</html>