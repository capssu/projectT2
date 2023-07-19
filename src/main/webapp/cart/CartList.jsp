<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<c:import url="/include/top.jsp" />
 <c:set var="path" value="${pageContext.request.contextPath}" />
 <script>
function delK(k){
	alert("k:"+k)
	location.href="${path}/CartDeleteOne.do?cartId="+k+"&custNo="+${m.custNo}
}

function delA(k){
	alert("k:"+k)
	location.href="${path}/CartDeleteAll.do?&custNo="+k
}
</script>
<section>
<br>
<div align="center">
<h2> 장바구니 목록조회 </h2>
<form method="post" name="f1">
<table border=1 width=750>
<tr align="center">
<th>장바구니ID</th><th>상품이름</th>
<th>상품가격</th><th>상품수량</th>
<th>상품이미지</th><th>취소</th>
</tr>
<c:forEach items="${li}" var="c">
<input type=hidden name=cartId value="${c.cartId}">
<input type=hidden name=custNo value="${m.custNo}">
<input type=hidden name=productId value="${c.productId}">
<input type=hidden name=productName value="${c.productName}">
<tr align="center">
<td>${c.cartId}</td>
<td align="left">&emsp;${c.productName}</td>

<td align="right">
<fmt:formatNumber value="${c.productPrice}" pattern="#,###" /></td>
<td><input type="number" value="${c.amount}" name=amount></td>
<td><img src="${path}/product/files/${c.productImgStr}" width=150 height=150 /></td>
<td align=center>
<input type=button value="삭제" onClick="delK('${c.cartId}')"></td>
</tr>
<c:set var="sum" value="${c.productPrice*c.amount}"> </c:set>
<c:set var="total" value="${total+sum}"> </c:set>
</c:forEach>
<tr>
<td colspan=6 align="left">

<c:if test="${total >= 30000}">
배송비 : <c:set var="baesongbi" value="0" />${baesongbi}원<br>
장바구니 금액합계:<fmt:formatNumber value="${total}" pattern="#,###" />원
</c:if>

<c:if test="${total < 30000}">
배송비 : <c:set var="baesongbi" value="3000" />${baesongbi}원<br>
장바구니 금액합계:
<fmt:formatNumber value="${total+3000}" pattern="#,###" />

</c:if>
</td></tr>
<tr>
<td colspan=6 align="center">
<input type=hidden name="baesongbi" value="${baesongbi}">
<input type=hidden name="totalmoney" value="${total}">

<input type=submit value="주문하기" onClick="javaScript:action='${path}/CartOrder.do'" />&nbsp;
<input type=submit value="수정하기" onClick="javaScript:action='${path}/CartUpdate.do'" />&nbsp;
<input type=button value="전체삭제하기" onClick="delA('${m.custNo}')" />
</td>
</tr>
</table>
</form>
<br>

</div>
<br>

</section>
<c:import url="/include/bottom.jsp" />