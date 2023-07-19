<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />

<section>
<br>

<div align="center">
<h2> 회원목록 페이지 </h2>
<table border=1>
<tr align="center"><td>회원번호</td>
<td>회원성명</td><td>회원등급</td>
<td>구매금액</td></tr>

<c:forEach items="${li}" var="m">
<tr align="center">
<td>${m.custNo}</td>
<td>${m.custName}</td>
<td>
<c:choose>
	<c:when test="${m.grade=='A'}">
		<c:out value="VIP" />
	</c:when>
	<c:when test="${m.grade=='B'}">
		<c:out value="일반" />
	</c:when>
	<c:when test="${m.grade=='C'}">
		<c:out value="직원" />
	</c:when>
</c:choose>
</td>
<td>${m.price}</td>
</tr>
</c:forEach>
</table>
<br>
<form action="${path}/Shop_selectAll.do" >
<input type=submit value="목록보기">
</form>

<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />