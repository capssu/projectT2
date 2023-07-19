<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />

<section>
<br>

<div align="center">
<h2> 전기차 충전소 목록 </h2>
<table border=1>
<tr align="center"><td>번호</td><td>충전소명칭</td><td>주소</td>
<td>충전기명칭</td><td>충전기상태</td>
<c:forEach items="${li}" var="m">
<tr align="center">
<td>${m.idx}</td>
<td>${m.csNm}</td>
<td>${m.addr}</td>
<td>${m.cpNm}</td>
<td>${m.cpStat}</td>
</c:forEach>
</table>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />