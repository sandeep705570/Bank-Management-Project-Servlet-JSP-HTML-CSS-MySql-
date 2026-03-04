<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%

    String an=session.getAttribute("accountNumber").toString();
    String oldPassword=request.getParameter("oldPassword");
    String newPassword=request.getParameter("newPassword");
    String confirmPassword=request.getParameter("confirmPassword");
    
    if(!confirmPassword.equals(newPassword))
    {
    	response.sendRedirect("changePassword.jsp?msg=not mached");
    }
    else
     try{
    		int check=0;
    	    {
    	    	Connection con=ConnectionProvider.getCon();
    	    	Statement st=con.createStatement();
    	    	ResultSet rs=st.executeQuery("select * from users where  password='"+oldPassword+"' and accountNumber='"+an+"' ");
    	    	while(rs.next())
    	    	{
    	    		check=1;
    	    		st.executeUpdate("update users set password='"+newPassword+"' where accountNumber='"+an+"' ");
    	    		response.sendRedirect("changePassword.jsp?msg=changed");
    	    		//System.out.println("Changed..");
    	    	}
    	    	if(check==0)
    	    	{
    	    		response.sendRedirect("changePassword.jsp?msg=wrongOldPass");
    	    	}
    	    }
    	   
     }
    catch(Exception e)
    {
    	System.out.println(e);
    	//response.sendRedirect("changePassword.jsp?msg=wrong");
    }
%>