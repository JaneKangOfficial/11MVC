<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
           text-align:center; position: relative; padding-top : 70px;
        }
      
        #container{
			height:5000px;
		}
		#content{
			color:gray;
			height:5000px;
		}
		#log{
			position:fixed;
			top:0;
			left:0;
		 	right:0;
			margin:0;
			height:200px;	
			background-color:rgba(0,0,0,0.7);	
			text-align:center;
			line-height:50px;
		}
		#container span{
			color:white;
		}
		#b{
			display:none;
		}
   	</style>
   	<script type="text/javascript">
   	$(window).on("scroll", function() {
   		var scrollHeight = $(document).height();
   		var scrollPosition = $(window).height() + $(window).scrollTop();		

   		$("#scrollHeight").text(scrollHeight);
   		$("#scrollPosition").text(scrollPosition);
   		$("#bottom").text(scrollHeight - scrollPosition);

   		if (scrollPosition > scrollHeight - 500) {			
   			//todo
   			$("body").append('<div id="content"></div>');
   		}
   	});
   	</script>
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   
   <div class="container">
      <!-- Main jumbotron for a primary marketing message or call to action -->

     <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img class="img-responsive center-block" src="images/a.jpg" alt="First slide">
          </div>
          <div class="item">
            <img class="img-responsive center-block" src="images/b.jpg" alt="Second slide">
          </div>
          <div class="item">
            <img class="img-responsive center-block" src="images/c.jpg" alt="Third slide">
          </div>
        </div>
        
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
	
	 	<hr/><hr/><hr/>
    
        <h1>���� ��ũ�ο���������������������</h1>
        <hr/><hr/><hr/>
        <h3>���������� �̷��� ���ߴ�.</h3>
        <p>"���� ���� ������ ������ ���� �߸� ���� �ð��� �����̴�."</p>
  	 	<h3>"... �庮�� �����ϰ� ������ �ʴ� ������� �ɷ������� �����մϴ�. �庮��. ����� �ƴ϶� '�ٸ�' ������� ���߰� �Ϸ��� �ű� �ִ� ��������."</h3>
         <h3>��������</h3>
         <p>�ູ�� ���� �����.</p>
         <p>�����ϴ� ���� �ϴ� ���� �Ƹ���,</p>
         <p>���� �ϴ� ���� �����ϴ� ���Դϴ�.</p>
         
         <hr/><hr/><hr/>
         
         <span class="container">
		  <span class="col-xs-6 col-md-3">
		    <a href="#" class="thumbnail">
		      <img src="images/aa.jpg" alt="images/aa.jpg"> ���
		    </a>
		  </span>
		
		  <span class="col-xs-6 col-md-3">
		    <a href="#" class="thumbnail">
		      <img src="images/bb.jpg" alt="images/bb.jpg"> ��ٶ��
		    </a>
		</span>
		
		  <span class="col-xs-6 col-md-3">
		    <a href="#" class="thumbnail">
		      <img src="images/cc.jpg" alt="images/cc.jpg"> ��ٶ�ٶ��
		    </a>
		  </span>
		</span>
  	 </div>
</body>

</html>