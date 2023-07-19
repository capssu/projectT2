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
<table border=1 width=800>
<tr align="center">
<td colspan=4 align="left">
 주문코드 : ${li[0].orderG} <br>
 구매자 : ${li[0].custName} <br>
 전화번호 : ${li[0].phone} <br>
 주소 : ${li[0].address} <br>
</td></tr>
<tr align="center">
<td>번호</td>
<td>상품코드</td>
<td>상품이름</td>
<td>수량</td>
</tr>
<c:forEach items="${li}" var="z">
<tr align="center">
<td>${z.idx}</td>
<td>${z.productId}</td>
<td>${z.productName}</td>
<td>${z.amount}</td>
</tr>
</c:forEach>

<tr align="center">
<td colspan=4 align="left">
 주문금액 : ${li[0].totalmoney}<br>
 배송비 : ${li[0].baesongbi}<br>
 주문날짜 : <fmt:formatDate value="${li[0].getDate}" pattern="yyyy년 MM월dd일" /><br>

</tr>
</table>
</form>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />