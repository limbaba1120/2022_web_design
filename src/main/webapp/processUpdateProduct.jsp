<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
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

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from product where p_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			if(fileName != null){
				sql="UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_duration=?, p_continent=?, p_travelPlace=?, p_unitsInStock=?, p_category=?, p_fileName=? WHERE p_id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setLong(4, durate);
				pstmt.setString(5, continent);
				pstmt.setString(6, travelPlace);
				pstmt.setLong(7, stock);
				pstmt.setString(8, category);
				pstmt.setString(9, fileName);
				pstmt.setString(10, productId);
				pstmt.executeUpdate();
			} else{
				sql="UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_duration=?, p_continent=?, p_travelPlace=?, p_unitsInStock=?, p_category=?, WHERE p_id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setLong(4, durate);
				pstmt.setString(5, continent);
				pstmt.setString(6, travelPlace);
				pstmt.setLong(7, stock);
				pstmt.setString(8, category);
				pstmt.setString(9, productId);
				pstmt.executeUpdate();
			}
		}
		
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();

		response.sendRedirect("editProduct.jsp?edit=update");
	%>
	
	