<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap1.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/carousel.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<jsp:include page="font.jsp" />
<meta charset="UTF-8">
<title>Welcome</title>
</head>


<body style="padding:0px; margin:0px; background-color:#fff;font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">
	<%@ include file="menu.jsp"%>

	 <%@ include file="carousel.jsp" %>

	<div>
		<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
			<div class="container">
				<h1 class="display-3" align="center">BEST 상품</h1>
			</div>
		</div>
	</div>

	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfBestProducts = dao.getAllBestProducts();
	%>

	<div class="container">
		<div class="row" align="center">
			<% 
				for (int i = 0; i < listOfBestProducts.size(); i++) {
					Product product = listOfBestProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=product.getFilename()%>" style="width: 100%">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getUnitPrice() %>
					원
				</p>
				<p>
					<a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-outline-primary" role="button">상세 정보 &raquo;</a>
				</p>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>

	<main role="main">
		<div class="container">
			<div class="text-center">
				<%
				response.setIntHeader("Refresh", 60);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시각: " + CT + "\n");
			%>
			</div>
			<hr>
		</div>
	</main>

	<%@ include file="footer.jsp"%>
	
</body>
</html>