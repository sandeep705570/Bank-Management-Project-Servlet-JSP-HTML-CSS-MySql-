<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
      String name=request.getParameter("name");
      String fname=request.getParameter("fatherName");
      String mname=request.getParameter("motherName");
      String add=request.getParameter("address");
      String city=request.getParameter("city");
      String state=request.getParameter("state");
      String country=request.getParameter("country");
      String email=request.getParameter("email");
      String mobileNumber=request.getParameter("mobileNumber");
      String pass=request.getParameter("password");
      String gender=request.getParameter("gender");
      String accountNumber=" ";

  try{
	  Connection con=ConnectionProvider.getCon();
	  PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?)");
	  ps.setString(1, name);
	  ps.setString(2, fname);
	  ps.setString(3, mname);
	  ps.setString(4, add);
	  ps.setString(5, city);
	  ps.setString(6, state);
	  ps.setString(7, country);
	  ps.setString(8, email);
	  ps.setString(9, mobileNumber);
	  ps.setString(10, accountNumber);
	  ps.setString(11, pass);
	  ps.setString(12, gender);
	 
	  ps.executeUpdate();
	  response.sendRedirect("userAccountOpeningForm.jsp?msg=done");
  }
  catch(Exception e)
  {
	  System.out.println(e);
	  response.sendRedirect("userAccountOpeningForm.jsp?msg=invalid");
  }
      

%>