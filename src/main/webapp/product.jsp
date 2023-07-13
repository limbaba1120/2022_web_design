<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

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
<title>상품 상세 정보 </title>
</head>
<body>
	<script type="text/javascript">
		function addToCart() {
			if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class="container">
			<h1 class="display-3">상품 정보 </h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=product.getFilename()%>" style="width: 100%" >
			</div>
			<div class="col-md-6">
				<h3>[<%=product.getCategory() %>] <%=product.getPname() %></h3>
				<p><h4><%=product.getDescription() %></h4></p>
				<p> <b>여행 기간</b> : <%=product.getDuration() %>일
				<p> <b>상품 코드 : </b><span class="badge badge-danger"><%=product.getProductId()%></span>
				<p> <b>대륙</b> : <%=product.getContinent() %>
				<p> <b>여행 나라</b> : <%=product.getTravelPlace() %>
				<p> <b>재고 수</b> : <%=product.getUnitsInStock() %>
				<p> <b>가격</b> : <%=product.getUnitPrice() %> 원</p>
				<p> <form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-light">장바구니 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>
			
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<%@ page errorPage="exceptionNoProductId.jsp" %>
</body>
</html>