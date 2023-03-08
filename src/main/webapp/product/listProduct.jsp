
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>��ǰ �˻�</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
	function fncGetProductList(currentPage, menu){
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage);
	/* 	alert(currentPage);  */
		/* document.getElementById("menu").value = menu; */
		$("#menu").val(menu);
	/* 	 alert(menu); */ 
		/* $("#prodNo").val(); */
		/* document.detailForm.submit(); */
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
	}	
	
	$(function() {
		var menu = $("#menu").val(); 
		/* alert("listProduct.jsp menu= "+menu); */
		/* var prodNo = $("prodNo").val(); */
		/* var prodNo =$("#prodNo").val(); */
		var currentPage = $("#currentPage").val();
		/* alert("listProduct.jsp prodNo= "+prodNo); */
		//�������ø� ������
		 /* var availableTags = [
		      "ActionScript",
		      "AppleScript",
		      "Asp",
		      "BASIC",
		      "C",
		      "C++",
		      "Clojure",
		      "COBOL",
		      "ColdFusion",
		      "Erlang",
		      "Fortran",
		      "Groovy",
		      "Haskell",
		      "Java",
		      "JavaScript",
		      "Lisp",
		      "Perl",
		      "PHP",
		      "Python",
		      "Ruby",
		      "Scala",
		      "Scheme"
		    ]; */
		
		/*$(".input[name=searchKeyword]").autocomplete({
			source : availableTags
			select : function(event, ui) { //item ���ý� �̺�Ʈ
				console.log(ui, item);
			},
			focus : function(event,ui) { //��Ŀ���� �̺�Ʈ
				return false;
			}
			minLength : 1, //�ּ� ���ڼ�
			autoFocus : true,  // �޴��� ǥ�õɶ� ù��° �׸� ��Ŀ��
			classes : { //���� ��ҿ� �߰��� Ŭ����
				'ui-autocomplete' : 'highlight'
			},
			delay : 500, //�������ø� �̺�Ʈ �߻����� �����ð� ms
			disable : false, //true�� �ڵ��ϼ���� ����
			position : {my : 'right top', at : 'right bottom'}, // ���� �޴��� ��ġ �ĺ�
			close : function(event) { // �ڵ��ϼ� â �ݾ������� �̺�Ʈ
				consol.log(event)
			}
		});  */
		
		$( ".ct_btn01:contains('�˻�')" ).on("click", function() {
			/* alert(  $( "td.ct_btn01:contains('�˻�')" ).html() ); */
			/* var searchK= $("input[name=searchKeyword]").val();*/
			/*alert(searchK);*/
			/* $( "input[name=searchKeyword]" ).autocomplete({
			      source: availableTags
			    });  */
			fncGetProductList(currentPage,menu);
		})
								
		$( ".ct_list_pop td:nth-child(3)").on("click", function() {
			var prodNo = $(this).children($("#prodNo")).val();
			//var prodNo = $(this).text().trim();
			
			//alert("menu= "+menu);
			
			if(menu=="search"){
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
	
								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h3>"
															+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
															+"��    �� : "+JSONData.prodName+"<br/>"
															+"������ : "+JSONData.prodDetail+"<br/>"
															+"��    �� : "+JSONData.price+"<br/>"
															+"�������� : "+JSONData.manuDate+"<br/>"
															+"�� �� �� : "+JSONData.fileName+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+prodNo+"" ).html(displayValue);
							}
					}); 
				}else if(menu=="manage"){
				
				 self.location = "/product/getProduct?prodNo="+$(this).children($("#prodNo")).val()+"&menu="+menu;
				}
			
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
		$("h7").css("color" , "red");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		 
		 $( "td" ).on( "mouseover", function() {
			   $( this ).css( "color", "#FF8000" ); 
			 /*  $( this ).css( "color", "#2E2E2E" ); */
			  
			});
		 $('td').on("mouseout", function(){
		      $(this).css("color","#505050");
		 });
	})

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<%-- <c:set var = "pageType" value="product" scope="request"/> --%>
<%-- <c:set var="pageType" value="product" scope="request"/>
<c:set var="menu" value="${param.menu}" scope="request"/>
<c:set var="prodNo" value="${product.prodNo}" scope="request"/> --%>

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<%-- <form name="detailForm" action="/listProduct.do?menu=${menu}" method="post"> --%>
<%-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> --%>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
				<c:choose>
			 		<c:when test="${param.menu eq 'manage' }"> 
			 			��ǰ ���� 
					</c:when>
					<c:when test="${param.menu eq 'search' }"> 
						��ǰ �����ȸ 
					</c:when>
				</c:choose>
			
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
								
				<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ǰ��ȣ</option>
				<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ǰ��</option>
				<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>����</option>
			</select>
			<div class="ui-widget">
			<input 	type="text" name="searchKeyword" 
							value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
							class="ct_input_g"	autocomplete="on" style="width:200px; height:20px " >
			</div>
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<%-- <a href="javascript:fncGetProductList('${resultPage.currentPage}','${param.menu}');">�˻�</a> --%>
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">
			��ǰ��<br>
			<h7> ��ǰ�� click:������</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
				<td align="left" title="Ŭ���ϼ���">
				<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			 	<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
				<c:choose>
			 		<c:when test="${param.menu eq 'manage' }"> 
						<%-- <a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
			 			
			 			<%-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%> 
			 			 ${product.prodName} 
					</c:when>
					<c:when test="${param.menu eq 'search' }"> 
						 <%-- <a href="/getProduct.do?menu=${param.menu}">${product.prodName}</a>  --%>
						<%-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}"> --%>
				<%-- 		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			 			<input type="hidden" id="menu" name="menu" value="${param.menu}"/> --%>
						${product.prodName}<!-- </a> -->
					</c:when>
				</c:choose>
				
			<%-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td> --%>
			<%-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td> --%>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>		
		</tr>
		<tr>
		<!-- <td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
			
			
			<%-- <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/> --%>
			<%-- <% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>','${param.menu}');"><%=i %></a>
			<% 	}  %>
			
			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>  --%>
		 
		
		<%--  <%
			for(int i=1;i<=totalPage;i++){
		%>
					
			<%if (menu.equals("manage")) {%>
			<a href="/listProduct.do?page=<%=i%>&menu=<%=menu%>"><%=i %></a>
			<% }%>
		<%
			}
		%> --%>
		
			
			<%-- <c:set var = "product" value="product" scope="request"/> --%>
			<%-- <c:set var = "search" value="search" scope="request"/>
			<c:set var = "menu" value="menu" scope="request"/> --%>
			
			
			<%-- <jsp:include page="../common/pageNavigator1.jsp"/> --%>
			<jsp:include page="../common/pageNavigator1.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>
<% System.out.println("listProduct.jsp 555555555555555555555555555555"); %>
</body>
</html>