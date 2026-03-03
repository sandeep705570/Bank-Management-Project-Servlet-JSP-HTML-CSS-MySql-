<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
   String an=session.getAttribute("accountNumber").toString();
   String name=request.getParameter("name");
   String fatherName=request.getParameter("fatherName");
   String motherName=request.getParameter("motherName");
   String gender=request.getParameter("gender");
   
   try{
	   Connection con=ConnectionProvider.getCon();
	   Statement st=con.createStatement();
	   st.executeUpdate("update users set name='"+name+"',fatherName='"+fatherName+"',motherName='"+motherName+"',gender='"+gender+"' where accountNumber='"+an+"' ");
	   
	   response.sendRedirect("changeName.jsp?msg=changed");
   }
   catch(Exception e)
   {
	   System.out.println(e);
	   response.sendRedirect("changeName.jsp?msg=not changed");
   }
%>