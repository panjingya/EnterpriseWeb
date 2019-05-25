<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Landing Page</title>
<link rel="stylesheet" href="css/main.css" type="text/css" media="all">
</head>
<body style="overflow: hidden;">
	<%@ include file="common_header.jsp"%>
	<!-- 轮播 -->
	<div id="fwslider" style="height: 554px;">
		<div class="slider_container">
			<div class="slide" style="opacity: 1; z-index: 0; display: none;">
				<img id="img1" src="img/img1.jpg">
			</div>
			<div class="slide" style="opacity: 1; z-index: 1; display: block;">
				<img id="img2" src="img/img2.jpg">
			</div>
			<div class="slide" style="opacity: 1; z-index: 1; display: block;">
				<img id="img3" src="img/img3.jpg">
			</div>
			<div class="slide" style="opacity: 1; z-index: 0; display: none;">
				<img id="img4" src="img/img4.jpg">
			</div>
			<div class="slide" style="opacity: 1; z-index: 0; display: none;">
				<img id="img5" src="img/img5.jpg">
			</div>
		</div>
		<div class="timers" style="width: 180px;"></div>
		<div class="slidePrev" style="left: 0px; top: 252px;">
			<span></span>
		</div>
		<div class="slideNext" style="right: 0px; top: 252px; opacity: 0.5;">
			<span></span>
		</div>
	</div>

	<div class="main_bg">
		<div class="business">BUSINESS</div>
		<div class="wrap w_72">
			<div class="grids_1_of_3">
				<div class="grid_1_of_3  images_1_of_3">
					<img src="img/pic1.png">

				</div>
				<div class="grid_1_of_3  images_1_of_3">
					<img src="img/pic2.png">

				</div>
				<div class="grid_1_of_3  images_1_of_3">
					<img src="img/pic3.png">

				</div>
				<div class="grid_1_of_3  images_1_of_3">
					<img src="img/pic4.png">

				</div>
				<div class="grid_1_of_3  images_1_of_3" style="background: none">
					<img src="img/pic5.png">

				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="address">
		Copyright All Rights. <br> 
		<a href="<%=basePath%>/admin/login.jsp" style="color:purple">ADMIN PAGE </a> <br>
	</div>
	<div class="clear"></div>

</body>
<script src="js/jquery.min.js">
	
</script>
<script src="js/jquery-ui.min.js">
	
</script>
<script src="js/fwslider.js">
	
</script>

</html>