<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />

<section>
<br>

<div align="center">
<h2> 경상남도 고용 우수 회사목록 </h2>
<table border=1>
<tr align="center"><td>회사번호</td><td>회사이름</td><td>주소</td>
<td>대표이름</td><td>위도</td><td>경도</td><td>고객등급</td></tr>
<c:forEach items="${li}" var="m">
<tr align="center">
<td>${m.idx}</td>
<td>${m.entrprsNm}</td>
<td>${m.rdnmadr}</td>
<td>${m.rprsntvNm}</td>
<td>${m.latitude}</td>
<td>${m.logitude}</td>
<td>${m.mainGoods}</td>
</c:forEach>
</table>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />