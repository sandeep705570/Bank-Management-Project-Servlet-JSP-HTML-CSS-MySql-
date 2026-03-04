<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%out.println("Update button running..."); %>
    
    <%
       String accountNumber=request.getParameter("accountNumber");
       String name=request.getParameter("name");
       String fname=request.getParameter("fatherName");
       String mname=request.getParameter("motherName");
       String address=request.getParameter("address");
       String city=request.getParameter("city");
       String state=request.getParameter("state");
       String country=request.getParameter("country");
       String email=request.getParameter("email");
       String mobile=request.getParameter("mobileNumber");
       String gender=request.getParameter("gender");
       
        try{
        	Connection con=ConnectionProvider.getCon();
        	Statement st=con.createStatement();
        	st.executeUpdate("update users set accountNumber='"+accountNumber+"',name='"+name+"',fatherName='"+fname+"',motherName='"+mname+"',address='"+address+"',city='"+city+"',state='"+state+"',country='"+country+"',email='"+email+"',mobileNumber='"+mobile+"',gender='"+gender+"' where accountNumber='"+accountNumber+"' ");
        	response.sendRedirect("allCustomers.jsp");
        }
        catch(Exception e)
        {
        	System.out.println(e);
        	response.sendRedirect("updateAccount.jsp");
        }
       
    %>
</body>
</html>