<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
   String an=session.getAttribute("accountNumber").toString();
   String email=request.getParameter("email");
   String mnumber=request.getParameter("mobileNumber");
   
   try{
	   Connection con=ConnectionProvider.getCon();
	   Statement st=con.createStatement();
	   st.executeUpdate("update users set email='"+email+"',mobileNumber='"+mnumber+"' where accountNumber='"+an+"' ");
	   
	   response.sendRedirect("changeMobileandEmail.jsp?msg=changed");
   }
   catch(Exception e)
   {
	   System.out.println(e);
	   response.sendRedirect("changeMobileandEmail.jsp?msg=not changed");
   }
%>