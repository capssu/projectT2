<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />
<section>
<br>
<div align="center">
<h2> 상품 목록 </h2>
<table border=1>
<tr align="center">
<td>상품번호</td><td>상품이름</td><td>상품가격</td>
<td>상품설명</td><td>상품사진</td><td>등록날짜</td>
</tr>
<c:forEach items="${li}" var="m">
<tr align="center">
<td>${m.productId}</td>
<td><a href="${path}/Product_SelectOne.do?productId=${m.productId}">${m.productName}</a></td>
<td>${m.productPrice}</td>
<td>${m.productDesc}</td>
<td><img src="${path}/product/files/${m.productImgStr}" width=100 heigth=100 /></td>
<td>
<fmt:parseDate value="${m.productDate}" var="registered" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${registered}" pattern="yy년MM월dd일" />
</td></tr>
</c:forEach>
</table>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />