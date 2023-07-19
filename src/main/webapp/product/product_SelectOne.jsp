<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<script>
function listK(){
	alert("목록보기")
	location.href="${path}/Product_SelectAll.do"
}

function delK(k){
	alert("삭제하기" + k)
	location.href="${path}/Product_Delete.do?productId="+k
}

</script>

<section>
<br>
<div align=center>
<h2>쇼핑몰 상품상세 보기</h2>

<form action=${path}/CartInsert.do >
 <input type=text name=productId value="${p.productId}" >
 <input type=text name=custNo value="${m.custNo}" >

<table border=1 width=650 height=350>
<tr><td align="center" width=150>상품번호</td>  
   <td > &emsp; ${p.productId} </td>
   <td rowspan=4 width=110>
   <img src=${path}/product/files/${p.productImgStr} width=200  height=250 />  </td>  </tr> 
<tr><td align="center">상품이름</td>  
   <td> &emsp; ${p.productName} </td></tr> 
<tr><td align="center">상품가격</td>  
   <td>&emsp;${p.productPrice} </td></tr>
<tr><td  align="center">상품설명</td>  
   <td ><textarea cols=40  rows=9 name=productDesc>${p.productDesc}</textarea> </td></tr>
<tr><td align="center">구매수량</td>  
   <td colspan=2> &emsp;
   <input type=number name="amount" min=1 max=5> </td></tr> 
<tr><td align="center">등록날짜</td>  
   <td colspan=2> &emsp;${p.productDate}</td></tr>     
<tr><td colspan=3  align="center"> 
    <input  type=submit value="장바구니담기" >
    &emsp;&emsp;
    <input  type=button value="목록보기" onClick="listK()" >
    &emsp;&emsp;
    <input  type=button value="삭제하기" onClick="delK('${p.productId}')" >
   </td></tr>
</table>
</form>
</div>
<br>
</section>
<c:import url="/include/bottom.jsp" />