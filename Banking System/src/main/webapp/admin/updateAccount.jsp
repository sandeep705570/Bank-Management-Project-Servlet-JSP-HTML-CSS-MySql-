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
    
    <link rel="stylesheet" href="registation.css">
</head>
<body>

<%
             String accountNumber=request.getParameter("accountNumber");
             
               try{
            	   Connection con=ConnectionProvider.getCon();
                   Statement st=con.createStatement();
                   String sql=("select*from users where accountNumber='"+accountNumber+"'");
                   ResultSet rs=st.executeQuery(sql);
                   while(rs.next())
                   {
             %>

    <div class="form-container">
        <div class="form-header">
             Account Opening Form
        
             <% 
 String msg=request.getParameter("msg");
 if("done".equals(msg))
 {
%>

<h1 style="color:red;">Success</h1>
<%} %>

<%
  if("invalid".equals(msg))
  {
 %>
<h1 style="color:red;">Some thing Went Wrong! Try Again !</h1>
<%} %>
             
             
             
        </div>        
        <form action="updateAccountAction.jsp" method="post">
            
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="accountNumber" value="<%=rs.getString(1)%>" readonly style="background-color:gray; color:white">
            </div>
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%=rs.getString(2)%>" required>
            </div>
            
            <div class="form-group">
                <label>Father Name</label>
                <input type="text" name="fatherName" value="<%=rs.getString(3)%>" required>
            </div>
            
            <div class="form-group">
                <label>Mother Name</label>
                <input type="text" name="motherName" value="<%=rs.getString(4)%>">
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="<%=rs.getString(5)%>">
            </div>

            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" value="<%=rs.getString(6)%>" required>
            </div>
            
            <div class="form-group">
                <label>State</label>
                <input type="text" name="state" value="<%=rs.getString(7)%>" required>
            </div>
            
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country" value="<%=rs.getString(8)%>" required>
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="<%=rs.getString(9)%>" required>
            </div>
            
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text" name="mobileNumber" value="<%=rs.getString(10)%>" required>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" value="<%=rs.getString(12)%>" required>
            </div>

            <button type="submit" class="register-btn">Save</button> 
            &nbsp; &nbsp;<a href="allCustomers.jsp" style="background-color:red;padding:10px 15px; color:white; radius:10px 9px;"><b>Back</b></a>
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