<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="com.model2.mvc.service.domain.*" %> --%>

<%-- <%
	Product product = (Product)request.getAttribute("Product");
    System.out.println("updateProdecut.jsp product= "+product);
    String menu = request.getParameter("menu");
%> --%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>상품정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

function fncUpdateProduct() {

	/* /* var prodNo=document.detailForm.prodNo.value; */ 
	/* var name = document.detailForm.prodNo.value; */
	/* var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value; */
	/* if(name == null || name.length <1){
		alert("이름은  반드시 입력하셔야 합니다.");
		return;
	} */
/* 	document.getElementById("menu").value = menu;  */
	 /* document.detailForm.action='/product/updateProduct'; */
	 $("form").attr("method","POST").attr("action","/product/updateProduct").submit();
}	 
	$(function() {
		$( ".ct_btn01:contains('수정')" ).on("click", function(){
			fncUpdateProduct();
		})
	})
	/* function resetData() {
	document.detailForm.reset();
	} */
	$(function() {
		$(".ct_btn01:contains('취소')" ).on("click", function() {
			history.go(-1);
		})
	})
	
	 





</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<%-- <c:set var="menu" value="${param.menu}" scope="request"/> --%>
<form name="detailForm"  >

<input type="hidden" name="prodNo" value="${product.prodNo}">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품정보수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodName}</td>
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" value="${product.price}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="manuDate" value="${product.manuDate}" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="100">
		</td>
	<%-- 	<fmt:parseDate var="regDate" value="${ product.regDate }" pattern="yyyy-MM-dd" /> --%>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">상품이미지 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input 	type="text" name="fileName" value="${product.fileName}" class="ct_input_g" 
										style="width:100px; height:19px" onChange="check_email(this.form);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncUpdateProduct();">수정</a> -->
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:resetData();">취소</a> -->
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<% System.out.println("updateProduct.jsp 666666666666666666666666666666666666"); %>
</body>
</html>
