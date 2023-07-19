<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />
<section>
<br>
<div align="center">
<h2> 주문 리스트 </h2>
<form method="post" name="f1">
<table border=1 width=750>
<tr align="center">
<th>순번</th><th>구매자코드</th>
<th>배송비</th><th>주문금액</th>
<th>날짜</th>
</tr>
<c:forEach items="${li}" var="a">
<tr align="center">
<td><a href="${path}/OrderOne.do?idx=${a.idx}">${a.idx}</a></td>
<td>${a.ocustNo}</td>
<td>${a.baesongbi}</td>
<td>${a.totalmoney}</td>
<td><fmt:formatDate value="${a.getDate}" pattern="yyyy-MM-dd" /></td>
</tr>
</c:forEach>
</table>
</form>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />