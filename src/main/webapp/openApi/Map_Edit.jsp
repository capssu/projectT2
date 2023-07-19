<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<section>
<br>
<form>
<div align="center">
<h2>회사 상세 보기</h2>
<table border=1 align="center">
<tr><td colspan=2><div id="map" style="width:100%; height:350px;"></div></td></tr>
<tr><td align=center width=150><b>회사번호</b></td><td width=350>
<input type=number name="idx" value="${m.idx}" size=10></td></tr>
<tr><td align=center><b>회사이름</b></td>
<td><input type=text name="entrprsNm" value="${m.entrprsNm}"></td></tr>
<tr><td align=center><b>회사주소</b></td>
<td><input type=text name="rdnmadr" value="${m.rdnmadr}"></td></tr>
<tr><td align=center><b>대표이름</b></td>
<td><input type=text name="rprsntvNm" value="${m.rprsntvNm}" size=10></td></tr>
<tr><td align=center><b>주력상품</b></td>
<td><input type=text name="mainGoods" value="${m.mainGoods}" size=30></td></tr>
</table>
<p>
<button onclick="setBounds()">지도 가운데로</button> 
</p>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=467836cb885ef06b1e95496a478a4d87"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${m.latitude}, ${m.logitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points = [
    new kakao.maps.LatLng(${m.latitude}, ${m.logitude}),
    new kakao.maps.LatLng(33.452671, 126.574792),
    new kakao.maps.LatLng(33.451744, 126.572441)
];

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds();    

var i, marker;
for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker =     new kakao.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(points[i]);
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
</script>
</div>
</form>
<br>

</section>

<c:import url="/include/bottom.jsp" />