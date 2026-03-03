<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
   String accountNumber=request.getParameter("accountNumber");
   
   out.println(accountNumber);
   
   try{
	   Connection con=ConnectionProvider.getCon();
	   Statement st=con.createStatement();
	   st.executeUpdate("delete from users where accountNumber='"+accountNumber+"' ");
	   response.sendRedirect("allCustomers.jsp");
   }
   catch(Exception e)
   {
	   System.out.println(e);
   }
%>