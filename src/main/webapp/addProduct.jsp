<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Product" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap1.min.css">
<!-- Custom styles for this template -->
<link href="./resources/css/carousel.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<jsp:include page="font.jsp" />
<title>상품 등록</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	<jsp:include page="menu.jsp"/>
	<div class = "jumbotron shadow p-3 mb-5 bg-body rounded text-bg-light p-3">
		<div class = "container">
			<h1 class = "display-3"> <fmt:message key="title"/></h1>
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-right">
			<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
			</div>
			<form action="./processAddProduct.jsp" name="newProduct" class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId"/></label>
					<div class="col-sm-3">
						<input type="text" id="productId" name="productId" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname"/></label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description"/></label>
					<div class="col-sm-5">
						<textarea name="description" id="" cols="50" rows="2" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="duration"/></label>
					<div class="col-sm-3">
						<input type="text" id="duration" name="duration" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="continent"/></label>
					<div class="col-sm-3">
						<input type="text" name="continent" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="travelPlace"/></label>
					<div class="col-sm-3">
						<input type="text" name="travelPlace" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category"/></label>
					<div class="col-sm-5">
						<input type="radio" name="category" value="BEST"> <fmt:message key="category_BEST"/>
						<input type="radio" name="category" value="SALE"> <fmt:message key="category_SALE"/>
						<input type="radio" name="category" value="NEW"> <fmt:message key="category_NEW"/> 
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productImage"/></label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddProduct()">
					</div>
				</div>
				
			</form>
		</div>
		</fmt:bundle>
		<hr>
	<%@ include file="footer.jsp" %>
</body>
</html>