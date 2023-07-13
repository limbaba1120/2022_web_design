<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

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
<title>상품 수정</title>
</head>
<%
String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>

			<%@ include file="dbconn.jsp"%>
		
			<%
		String productId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql="select * from product where p_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class = "container">
		<div class = "row">
			<div class="col-md-5">
			<img src="c:/upload/<%=rs.getString("p_fileName") %>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
			<form action="./processUpdateProduct.jsp" name="newProduct" class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2">상품 코드</label>
					<div class="col-sm-3">
						<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("p_id") %>'>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("p_name") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">상세 설명</label>
					<div class="col-sm-5">
						<textarea name="description" id="" cols="50" rows="2" class="form-control"><%=rs.getString("p_description") %></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">기간</label>
					<div class="col-sm-3">
						<input type="text" id="duration" name="duration" class="form-control" value="<%=rs.getLong("p_duration") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">대륙</label>
					<div class="col-sm-3">
						<input type="text" name="continent" class="form-control" value="<%=rs.getString("p_continent") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">여행 나라</label>
					<div class="col-sm-3">
						<input type="text" name="travelPlace" class="form-control" value="<%=rs.getString("p_travelPlace") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">재고 수</label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock") %>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-5">
						<input type="radio" name="category" value="BEST"> BEST
						<input type="radio" name="category" value="SALE"> SALE
						<input type="radio" name="category" value="NEW"> NEW 
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
				
			</form>
			</div>
		</div>
		
		</div>
		
		<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		%>


	
	<jsp:include page="footer.jsp" />
</body>
</html>
