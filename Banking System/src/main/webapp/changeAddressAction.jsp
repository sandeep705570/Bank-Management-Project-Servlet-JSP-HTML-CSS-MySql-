<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
   String an=session.getAttribute("accountNumber").toString();
   String add=request.getParameter("address");
   String city=request.getParameter("city");
   String state=request.getParameter("state");
   String country=request.getParameter("country");
   
   try{
	   Connection con=ConnectionProvider.getCon();
	   Statement st=con.createStatement();
	   st.executeUpdate("update users set address='"+add+"',city='"+city+"',state='"+state+"',country='"+country+"' where accountNumber='"+an+"' ");
	   
	   response.sendRedirect("changeAddress.jsp?msg=changed");
   }
   catch(Exception e)
   {
	   System.out.println(e);
	   response.sendRedirect("changeAddress.jsp?msg=not changed");
   }
%>