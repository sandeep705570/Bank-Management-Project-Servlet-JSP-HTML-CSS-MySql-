<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%
  

     String an=session.getAttribute("accountNumber").toString();

     String creditStr=request.getParameter("credit");
     int credit = Integer.parseInt(creditStr);

     String pass=request.getParameter("password");
     
     int debitStr=0;
     
   // int debit=Integer.parseInt(debitStr);
     
     int amount_credit=0;
     int total_amount=0;
     
     //int check=0;
     
     try{
    	 Connection con=ConnectionProvider.getCon();
    	 PreparedStatement ps=con.prepareStatement("update users set total=total + ? where accountNumber=? and password=?");
         ps.setInt(1, credit);
         ps.setString(2, an);
         ps.setString(3, pass);
        int check= ps.executeUpdate();
         
         if(check>0){
             response.sendRedirect("creditSuccessMsg.html?msg");

         }
         else
         {
             response.sendRedirect("creditAmount.jsp?msg=wrong");

         }
         
    /*	 Statement st=con.createStatement();
    	 ResultSet rs=st.executeQuery("select * from users where accountNumber='"+an+"' and password='"+pass+"' ");
    	 while(rs.next())
    	 {
    		 
    		 PreparedStatement ps=con.prepareStatement("insert into amount (accountNumber,credit,debit) values(?,?,?)");
    		 ps.setString(1, an);
    		 ps.setInt(2, credit);
    		 ps.setInt(3, debitStr);  		
    		 ps.executeUpdate();	     		 
    	 }
    	    
    	 Statement st2=con.createStatement();
    	 ResultSet rs2=st2.executeQuery("select * from amount where accountNumber='"+an+"'");
    	 while(rs.next())
    	 {
    		 amount_credit=rs2.getInt(3);
    		 total_amount=total_amount+amount_credit;
    		 check=1;
    	 }
    	 
    	 if(check==1)
    	 {
    		 Statement st3=con.createStatement();
        	 st3.executeUpdate("update users set total='"+total_amount+"' where accountNumber='"+an+"' ");
        	
        	 response.sendRedirect("creditSuccessMsg.html");
    	 }
    	     	 
    	 if(check==0)
    	 {
    		 response.sendRedirect("creditAmount.jsp?msg=wrong");
    	 }  */
     }
     catch(Exception e)
     {
    	 System.out.println(e);
    	 response.sendRedirect("creditAmount.jsp?msg=invalid");
     }
%>