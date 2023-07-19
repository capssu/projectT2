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
<tr align="center"><td>회원번호</td><td>회원성명</td><td width=120>전화번호</td>
<td width=200>주소</td><td width=110>가입일자</td><td>고객등급</td>
<td>거주지역</td></tr>
<c:forEach items="${li}" var="m">
<tr align="center">
<td>${m.custNo}</td>
<td><a href="${path}/Shop_edit.do?custNo=${m.custNo}">${m.custName}</a></td>
<td>${m.phone}</td>
<td>${m.address}</td>
<td>
<fmt:parseDate value="${m.joindate}" var="registered" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${registered}" pattern="yy년MM월dd일" />
</td>

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
<td>${m.city}</td></tr>
</c:forEach>
</table>
<br>

<form action="${path}/Shop_selectAll.do">
<select name="ch1">
<option value="custName">이름</option>
<option value="phone">전화번호</option>
<option value="address">주소</option>
</select>
<input type=text name="ch2">
<input type=submit value="검색">
</form>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />