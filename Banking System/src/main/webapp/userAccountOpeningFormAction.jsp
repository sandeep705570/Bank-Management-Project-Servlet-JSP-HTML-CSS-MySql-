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
      
      int amount=0;
      String an=request.getParameter("accountNumber");
      
  try{
	  Connection con=ConnectionProvider.getCon();
	  PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	 
	  ps.setString(1, an);
	  ps.setString(2, name);
	  ps.setString(3, fname);
	  ps.setString(4, mname);
	  ps.setString(5, add);
	  ps.setString(6, city);
	  ps.setString(7, state);
	  ps.setString(8, country);
	  ps.setString(9, email);
	  ps.setString(10, mobileNumber);
	  
	  ps.setString(11, pass);
	  ps.setString(12, gender);
	  ps.setInt(13, amount);
	  
	 
	  ps.executeUpdate();
	  response.sendRedirect("userAccountOpeningForm.jsp?msg=done");
  }
  catch(Exception e)
  {
	  System.out.println(e);
	  response.sendRedirect("userAccountOpeningForm.jsp?msg=invalid");
  }
      

%>