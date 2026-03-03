<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
  String name=request.getParameter("name");
  String fname=request.getParameter("fatherName");
  String mname=request.getParameter("motherName");
  String address=request.getParameter("address");
  String city=request.getParameter("city");
  String state=request.getParameter("state");
  String country=request.getParameter("country");
  String email=request.getParameter("email");
  String mNumber=request.getParameter("mobileNumber");
  String acNumber=request.getParameter("accountNumber");
  String pass=request.getParameter("password");
  String gender=request.getParameter("gender");
  String total="0";
  
  try{
	  
	  Connection con=ConnectionProvider.getCon();
	  PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	  ps.setString(1, name);
	  ps.setString(2, fname);
	  ps.setString(3, mname);
	  ps.setString(4, address);
	  ps.setString(5, city);
	  ps.setString(6, state);
	  ps.setString(7, country);
	  ps.setString(8, email);
	  ps.setString(9, mNumber);
	  ps.setString(10, acNumber);
	  ps.setString(11, pass);
	  ps.setString(12, gender);
	  ps.setString(13, total);
	  ps.executeUpdate();
	  response.sendRedirect("registation.jsp?msg=done");
	  
  }
  catch(Exception e)
  {
	  System.out.println(e);
	  response.sendRedirect("registation.jsp?msg=invalid");
  }
%>