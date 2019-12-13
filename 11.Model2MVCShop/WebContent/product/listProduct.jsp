<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>list ��ǰ ��� ��ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  -->
	function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
	 $(function() {
		 
			//==> �˻� Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "button.btn.btn-default").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetUserList(1);
			});
			
			 $( "td:nth-child(2)" ).on("click" , function() {
				// alert(  $( this ).text().trim() );
				 self.location ="/product/updateProduct?prodNo="+$(this).text().trim();				 
			});
			 
			 $( "td:nth-child(2)" ).css("color" , "red");
				
			});	
			//==> userId LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					var prodNo = $(this).text().val();
					$.ajax( 
							{
								url : "/product/json/updateProduct/"+prodNo ,
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
																+"�� ǰ ��  : "+JSONData.prodName+"<br/>"
																+"��      �� : "+JSONData.price+"<br/>"
																+"�������� : "+JSONData.manuDate+"<br/>"																
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			//$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		//	$("h7").css("color" , "red");
			
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});
	
</script>

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��ȣ</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">��������</th>            
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"   title="Click : ��ǰ���� Ȯ��">${product.prodNo}</td>
			  <td align="left">${product.prodName}</td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.manuDate}</td>			  
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodName}"></i>
			  	<input type="hidden" value="${product.prodName}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>