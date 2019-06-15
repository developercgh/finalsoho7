<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- app d057d633bdc6c3205fbac31649c8b475 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 12px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style>
</head>
<body>
<div style="margin-top: 12px" align="center">
	<!-- 홈페이지 제목 -->
	<img alt="" src="image/mapm.png" border="0" id="logo" width="300px">
</div>
<div id="map" style="width:100%;height:350px"></div> <!-- 지도를 표시할 div 입니다 -->
<div id="roadview" style="width:100%;height:300px"></div> <!-- 로드뷰를 표시할 div 입니다 -->
<table>
<tr>
	<th>펜션찾아가는 길 </th>
</tr>
<tr>
	<th style="padding-top: 20px">＊ 자가용 방문시</th>
</tr>
<tr>
	<td>- 서울권에서 오실 경우</td>
</tr>
<tr>
	<td>서울 ⇨ 구리 ⇨ 덕소 ⇨ 팔당 ⇨ 두물머리 ⇨ 양평시내 진입전 오빈 교차로에서 월드컵주요소 끼고 좌회전 ⇨ 6번국도 ( 왕복4차선 )로 직진하면 오른쪽에 대명비발디파크 대형간판이 보임 ⇨ 간판에서 400M 정도 지나면 고가도로 넘어가는길 오른쪽 비발디파크 이정표따라 진입 ⇨ 굴다리밑으로 좌회전 후 직진 ⇨ 단월 명성터널까지 직진 ⇨ 명성터널 바로 전 오른쪽에 소호펜션 도착</td>
</tr>
<tr>
	<th style="padding-top: 20px">＊ 대중교통 이용시</th>
</tr>
<tr>
	<td>- 전철 이용</td>
</tr>
<tr>
	<td>경의중앙선 용문행전철 (20~30분간격) 용문역하차 ⇨ 용문버스터미널에서 일반버스 명성리행 탑승( 1일 5회 운행 : 오전 7시, 9시, 11시 오후2시, 5시) ⇨ 부안리 하차 (명성터널 직전)</td>
</tr>
<tr>
	<th style="padding-top: 20px">* 	 시외버스 이용시</th>
</tr>
<tr>
	<td>동서울터미널 용문행 시외버스 탑승 ⇨ 용문버스터미널에서 하차 후 일반버스 명성리행 탑승( 1일 5회 운행 : 오전 7시, 9시, 11시 오후2시, 5시) ⇨ 부안리 하차 (명성터널 직전)</td>
</tr>
<tr>
	<td>경의중앙선 용문행전철 (20~30분간격) 용문역하차 ⇨ 용문버스터미널에서 일반버스 명성리행 탑승( 1일 5회 운행 : 오전 7시, 9시, 11시 오후2시, 5시) ⇨ 부안리 하차 (명성터널 직전)</td>
</tr>
</table>
<br><br><br><br><br><br><br><br><br><br>.






<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d057d633bdc6c3205fbac31649c8b475"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapCenter = new daum.maps.LatLng(37.508304,127.6947103), // 지도의 중심좌표
    mapOption = {
        center: mapCenter, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

// 커스텀 오버레이에 표시할 내용입니다
// HTML 문자열 또는 Dom Element 입니다
var content = '<div class="overlay_info">';
content += '    <a href="http://place.map.daum.net/11776312" target="_blank"><strong>소호펜션</strong></a>';
content += '    <div class="desc">';
content += '        <span class="address">경기도 양평군 양동면 양동로 427</span>';
content += '    </div>';
content += '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new daum.maps.LatLng(37.508304,127.6947103);

// 커스텀 오버레이를 생성합니다
var mapCustomOverlay = new daum.maps.CustomOverlay({
    position: position,
    content: content,
    xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
    yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
});

// 커스텀 오버레이를 지도에 표시합니다
mapCustomOverlay.setMap(map);

var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
var rv = new daum.maps.Roadview(rvContainer); //로드뷰 객체
var rvClient = new daum.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

//지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
    rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
});

daum.maps.event.addListener(rv, 'init', function() {

    // 커스텀 오버레이를 생성합니다
    var rvCustomOverlay = new daum.maps.CustomOverlay({
        position: position,
        content: content,
        xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
        yAnchor: 0.5 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
    });

    //rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
    rvCustomOverlay.setMap(rv);

    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
    
    // 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
    var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());

    rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
});
</script>
</body>
</html>