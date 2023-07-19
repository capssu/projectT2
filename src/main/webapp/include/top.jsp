<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  

 <c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
 <c:set var="key" value="467836cb885ef06b1e95496a478a4d87" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쑤플렉스 SSuflex</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />

<style type="text/css">
</style>
</head>
<body>
<header>
 <b> 쑤플렉스 SSuflex </b>
</header>
<nav>
&emsp;&emsp;<a href="${path}/Shop_Form.do">회원등록</a>
&emsp;&emsp;<a href="${path}/Shop_selectAll.do">회원목록</a>
&emsp;&emsp;<a href="${path}/Shop_money.do">회원매출조회</a>
<c:if test="${id=='admin'}">
	&emsp;&emsp;<a href="${path}/Company.do">고용우수회사목록</a>
	&emsp;&emsp;<a href="${path}/EvSearch.do">전기충전소</a>
	&emsp;&emsp;<a href="${path}/EvSearchMap.do">전기충전지도</a>
	&emsp;&emsp;<a href="${path}/Map.do">우수회사지도보기</a>
</c:if>
&emsp;&emsp;<a href="${path}/product/product_Form.jsp">상품등록</a>
&emsp;&emsp;<a href="${path}/Product_SelectAll.do">상품목록</a>
&emsp;&emsp;<a href="${path}/index.jsp">홈으로</a>
<c:if test="${empty m.custNo}">
&emsp;&emsp;<a href="${path}/login/login.jsp">로그인</a>
</c:if>
<c:if test="${!empty m.custNo}">
&emsp;&emsp;<a href="${path}/CartList.do?custNo=${m.custNo}">장바구니</a>
&emsp;&emsp;<a href="${path}/logout.do?custNo=${m.custNo}">${m.custName}</a>
</c:if>
&emsp;&emsp;<a href="${path}/OrderList.do">전체주문목록</a>
</nav>