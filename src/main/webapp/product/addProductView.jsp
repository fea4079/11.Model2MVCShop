<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/bootstrap-datepicker.js"></script>
	<!--  <script type="text/javascript" src="../javascript/calendar.js"> --> 
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 20px;
        }
    </style>


<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	
	/* var prodName =$("input[name='prodName']").val();
	var prodDetail =$("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(prodName == null || prodName.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(prodDetail == null || prodDetail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	} */
	
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}
	$(function() {
		$(".btn btn-primary").on("click", function(){
			fncAddProduct();
		})
	})
	
	$(function() {
			 $("#cancel" ).on("click" , function() {
				history.go(-1);
			});
			
	});
	 

	</script>

</head>

<body>

<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="http://192.168.0.159:8080/">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�ǸŻ�ǰ���</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">
		
		  <div class="form-group">
		    <label for="pordName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="pordName" name="pordName" placeholder="��ǰ�� �Է��ϼ���"  >
		    </div>
		  </div>
		  		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������ �Է�">
		    </div>
		  </div>
		
		  <!-- <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������">
		      <img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
		    </div>
		  </div> -->
		  
		  <div class="form-group" data-provide="datepicker" data-date-format="yyyy/mm/dd"> <!-- input-group date -->
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������" >
		      	 <span class="glyphicon glyphicon-th" ></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="number" class="form-control" id="price" name="price" placeholder="���� ���ڷθ� �Է�">
		     </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label form-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="fileName" placeholder="���Ͼ��ε�" multiple>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-right">
		      <button type="button" id="sss" class="btn btn-primary" href="#">���</button>
			  <a class="btn btn-primary btn" id="cancel" href="#" role="button">���</a>
		    </div>
		  </div>
		</form>
	</div>	
		<!-- form Start /////////////////////////////////////-->
		
 
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>