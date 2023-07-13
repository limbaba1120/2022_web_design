<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String filename = "";
		String realFolder = "C:\\upload";
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String duration = multi.getParameter("duration");
		String continent = multi.getParameter("continent");
		String travelPlace = multi.getParameter("travelPlace");
		String unitsInStock = multi.getParameter("unitsInStock");
		String category = multi.getParameter("category");
	
		Integer price;
		
		if (unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		long stock;
		
		if(unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock);
		
		long durate;
		
		if(duration.isEmpty())
			durate = 0;
		else 
			durate = Long.valueOf(duration);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		ProductRepository dao = ProductRepository.getInstance();
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setDuration(durate);
		newProduct.setContinent(continent);
		newProduct.setTravelPlace(travelPlace);
		newProduct.setUnitsInStock(stock);
		newProduct.setCategory(category);
		newProduct.setFilename(fileName);
		
		dao.addProduct(newProduct);
		

		PreparedStatement pstmt = null;
		
		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setLong(5, durate);
		pstmt.setString(6, continent);
		pstmt.setString(7, travelPlace);
		pstmt.setLong(8, stock);
		pstmt.setString(9, category);
		pstmt.setString(10, fileName);
		pstmt.executeUpdate();
		
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
		
		response.sendRedirect("products.jsp");
		
	
		
	%>
		