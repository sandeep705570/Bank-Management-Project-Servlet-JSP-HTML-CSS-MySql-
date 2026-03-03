<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Open Form</title>
    
    <style>
         input[type="password"]
         input[type="number"]
         select {
               flex: 1;
               padding: 12px;
               border: 1px solid #ced4da;
               border-radius: 4px;
               background-color: #e9ecef;
               font-size: 0.9rem;
              }
    </style>
    
    <link rel="stylesheet" href="css/registation.css">
</head>
<body>
         <%
         String an=session.getAttribute("accountNumber").toString();
           try{
        	   Connection con=ConnectionProvider.getCon();
        	   Statement st=con.createStatement();
        	   ResultSet rs=st.executeQuery("select * from users where accountNumber='"+an+"' ");
               while(rs.next())
               {
            	   
         %>
  
  
    <div class="form-container">
        <div class="form-header">
             Change Name
              <%
     String msg=request.getParameter("msg");
     if("changed".equals(msg))
     {
   %>
    <h1>Name has been Changed...</h1>
  <%} %>
  <%
  if("not changed".equals(msg))
  {
  %>
  <h1>Sorry Something went wrong!</h1>
  <%} %>
          
        </div>
        
        <form action="changeNameAction.jsp" method="post">
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%=rs.getString(1)%>">
            </div>
            
            <div class="form-group">
                <label>Father Name</label>
                <input type="text" name="fatherName" value="<%=rs.getString(2)%>">
            </div>
            
            <div class="form-group">
                <label>Mother Name</label>
                <input type="text" name="motherName" value="<%=rs.getString(3)%>">
            </div>
            
            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" value="<%=rs.getString(12)%>">
            </div>

            
            <button type="submit" class="register-btn">Save</button>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="profileDetails.jsp" style="background-color: green; padding:10px 20px; color:white;" >Back</a>
        </form>
    </div>
   <%
   }
   }
   catch(Exception e)
   {
	   System.out.println(e);
   }
   
   %>
</body>
</html>