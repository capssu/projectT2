<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<section>
<br>
<div align="center">
<h2>전기충전소 상세 보기</h2>
<form>
<table border=1 align="center">
<tr><td colspan=2><div id="map" style="width:100%; height:350px;"></div></td></tr>
<tr><td align=center width=150><b>충전소번호</b></td><td width=350>
<input type="number" name="idx" value="${m.idx}" size=10></td></tr>
<tr><td align=center><b>충전소이름</b></td>
<td><input type="text" name="csNm" value="${m.csNm}" size=30></td></tr>
<tr><td align=center><b>충전기주소</b></td>
<td><input type="text" name="addr" value="${m.addr}" size=70></td></tr>
<tr><td align=center><b>급속충전여부</b></td>
<td><input type="text" name="cpNm" value="${m.cpNm}"></td></tr>
<tr><td align=center><b>충전기상태</b></td>
<td><input type="text" name="cpStat" value="${m.cpStat}" size=10></td></tr>
</table>
</form>
</div>
<br>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=467836cb885ef06b1e95496a478a4d87&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(34.9279704, 127.5080035), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${m.addr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${m.csNm}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</section>

<c:import url="/include/bottom.jsp" />
