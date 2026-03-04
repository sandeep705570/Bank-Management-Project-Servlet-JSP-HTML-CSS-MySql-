<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
  

     String an=session.getAttribute("accountNumber").toString();

     String debitStr=request.getParameter("debit");
     int debit = Integer.parseInt(debitStr);

     String pass=request.getParameter("password");
     
    int total_amount=0;
     
     try{
    	 Connection con=ConnectionProvider.getCon();
    	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery("select * from users where accountNumber='"+an+"' and password='"+pass+"'");
    	 while(rs.next())
    	 {
    		 total_amount=rs.getInt(13);
    	 }
    	 
    	 if(total_amount>0)
    	 {
    		 PreparedStatement ps=con.prepareStatement("update users set total=total - ? where accountNumber=? and password=?");
             ps.setInt(1, debit);
             ps.setString(2, an);
             ps.setString(3, pass);
            int check= ps.executeUpdate();
             
             if(check>0){
                 response.sendRedirect("creditSuccessMsg.html?msg");

             }
             else
             {
                 response.sendRedirect("debitAmount.jsp?msg=wrong");

             }
    	 }
    	 else
    	 {
    		 response.sendRedirect("debitAmount.jsp?msg=no balance");
    	 }
    	 
    	 
        
     }
     catch(Exception e)
     {
    	 System.out.println(e);
    	 response.sendRedirect("creditAmount.jsp?msg=invalid");
     }
%>