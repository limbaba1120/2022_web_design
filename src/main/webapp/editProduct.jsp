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
<title>상품 편집</title>
</head>
<script type="text/javascript">
function deleteConfirm(id) {
    if(confirm("해당 작품을 삭제합니다!!")==true)
       location.href="./deleteProduct.jsp?id="+id;
    else
       return;
 }

</script>
<%
String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
			<p>
				<a href="./addProduct.jsp" class="btn btn-secondary btn-outline-dark" role="button">상품 추가</a>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<%@ include file="dbconn.jsp"%>
		
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
						[<%=rs.getString("p_category")%>]
						<%=rs.getString("p_name")%>
						<%=rs.getString("p_duration")%>일
					</h4>
					<p class="fs-5 text-danger">
						최저가<%=rs.getString("p_unitPrice")%>원~
					</p>
					<p><%
               		if (edit.equals("update")) {
               		%>

					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-success" role="button"> 수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")){
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id") %>')" class="btn btn-danger" role="button"> 삭제 &raquo;></a>
					<%
						}
					%>
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
	
	<jsp:include page="footer.jsp" />
</body>
</html>
