
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">
	function fncGetProductList(currentPage, menu){
		$("#currentPage").val(currentPage);
		$("#menu").val(menu);
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
	}	
	
	$(function() {
		var menu = $("#menu").val(); 
		var prodNo = $("#prodNo").val();
		/* alert(prodNo) */
	
		var currentPage = $("#currentPage").val();
			
		$( ".btn.btn-default:contains('�˻�')" ).on("click", function() {
			fncGetProductList(currentPage,menu);
		})
								
		$( "td:nth-child(2)").on("click", function() {
			/* var prodNo = $(this).children('#prodNo').val();
			alert("prodNo= "+prodNo) */
			/* alert("prodNo="+$(this).text().trim(); */
			
			  self.location = "/product/getProduct?prodNo="+$(this).children($("#prodNo")).val()+"&menu="+menu;  
			/* self.location = "/product/getProduct?prodNo="+$("#prodNo").val()+"&menu="+menu; */
			 /*  self.location = "/product/getProduct?prodNo="+$(this).children($("input[name=prodNo]")).val()+"&menu="+menu;  */
			
		});
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
		$("h7").css("color" , "red");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		 
		 $( "td" ).on( "mouseover", function() {
			   $( this ).css( "color", "#FF8000" ); 			  
			});
		 $('td').on("mouseout", function(){
		      $(this).css("color","#505050");
		 });
	})

</script>
</head>
	<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

<form name="detailForm">

	<div class="page-header text-info">
		<c:choose>
			<c:when test="${param.menu eq 'manage' }"> 
			<h3>��ǰ����</h3>
			</c:when>
			<c:when test="${param.menu eq 'search' }">
			<h3>��ǰ�˻�</h3>
			</c:when>
		</c:choose>
	</div>

	<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ǰ��ȣ</option>
						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ǰ��</option>
						<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		 
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">������</th>
            <th align="left">��ǰ����</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Ŭ���ϼ���">${product.prodName}
			  	<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			  	<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			  	</td>
			 	
			  <td align="left">${product.prodDetail}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.proTranCode}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
    </div>
</form>


		<jsp:include page="../common/pageNavigator1.jsp"/>
<% System.out.println("listProduct.jsp 555555555555555555555555555555"); %>
</body>
</html>




<%--  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
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
		<!-- <td class="ct_list_b" width="150">�������</td>
		<td class="ct_line02"></td> -->
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
						 ${product.prodName} 
					</c:when>
					<c:when test="${param.menu eq 'search' }"> 
						 ${product.prodName}
					</c:when>
				</c:choose>
				
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>		
		</tr>
		<tr>
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
			
		
			<jsp:include page="../common/pageNavigator1.jsp"/>
    	</td>
	</tr>
</table>  --%>
<!--  ������ Navigator �� -->
