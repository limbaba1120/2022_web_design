<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap1.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/carousel.css" rel="stylesheet">
<jsp:include page="font.jsp" />
<meta charset="UTF-8">
<title>페이지 오류 </title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class = "jumbotron">
		<div class = "container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
	</div>
	
	<div class="container">
		<p><%=request.getRequestURL()%>
		<p> <a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a> 
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>