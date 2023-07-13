<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap1.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/carousel.css" rel="stylesheet">
<jsp:include page="font.jsp" />
<meta charset="EUC-KR">
<title>상품 목록</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
			<p>
				<a href="./addProduct.jsp" class="btn btn-secondary btn-outline-dark" role="button">상품 추가</a>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<%@ include file="dbconn.jsp"%>
			<%
			ProductRepository dao = ProductRepository.getInstance();
			ArrayList<Product> listOfProducts = dao.getAllProducts();
			%>
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
				Product product = listOfProducts.get(i);
			%>
			<div class="col-md-3">
				<img src="./resources/images/<%=product.getFilename()%>" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<h4>
					[<%=product.getCategory()%>]
					<%=product.getPname()%>
					<%=product.getDuration()%>일
				</h4>
				<p class="fs-5 text-danger">
					최저가<%=product.getUnitPrice()%>원~
				</p>
			</div>
			<div class="col-md-2" style="padding-top: 40px">
				<p>
					<a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-outline-primary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
			}
			%>

			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
				<div class="col-md-3">
					<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%">
				</div>
				<div class="col-md-7">
					<h4>
						[<%=rs.getString("p_category")%>]<%=rs.getString("p_name")%><%=rs.getString("p_duration")%>일
					</h4>
					<p class="fs-5 text-danger">
						최저가<%=rs.getString("p_unitPrice")%>원~
					</p>
				</div>
				<div class="col-md-2" style="padding-top: 40px">
					<p>
						<a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-outline-primary" role="button">상세 정보 &raquo;</a>
				</div>
			<%
			}
			%>
		</div>
		<%
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		%>
	</div>

	<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

<div>