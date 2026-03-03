<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
      String accountNumber=request.getParameter("accountNumber");
      String pass=request.getParameter("password");
      
      if("1234".equals(accountNumber) && "admin".equals(pass))
          {
    	  session.setAttribute("accountNumber", accountNumber);
    	  session.setAttribute("password", pass);
    	  response.sendRedirect("admin/adminHome.jsp");
          }
  else{
      int check=0;
      try{
    	  
    	  Connection con=ConnectionProvider.getCon();
    	  Statement st=con.createStatement();
    	  ResultSet rs=st.executeQuery("select * from users where accountNumber='"+accountNumber+"' and password='"+pass+"'");
    	  while(rs.next())
    	  {
    		  check=1;
    		  session.setAttribute("accountNumber", accountNumber);
        	  response.sendRedirect("userHome.jsp");
    	  }
    	  if(check==0)
    	  {
    		  response.sendRedirect("login.jsp?msg=not exist");
    	  }
    	  
      }
      catch(Exception e)
      {
    	  System.out.println(e);
    	  response.sendRedirect("login.jsp?msg=invalid");
      }
    }
%>