<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>주문 취소</title>
</head>
<body>

<jsp:include page="menu.jsp" />
	<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class="container">
			<h1 class="display-3">주문 취소</h1>
	</div>
</div>
<div class="container">
	<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
</div>
<div>
	<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>