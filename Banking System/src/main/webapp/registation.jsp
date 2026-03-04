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

    <div class="form-container">
        <div class="form-header">
             Account Opening Form
        
             <% 
 String msg=request.getParameter("msg");
 if("done".equals(msg))
 {
%>

<h1 style="color:red;">Successfully Registerd</h1>
<%} %>

<%
  if("invalid".equals(msg))
  {
 %>
<h1 style="color:red;">Some thing Went Wrong! Try Again !</h1>
<%} %>
        <%
 int id=39558;
    try{
	 
	 Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select max(accountNumber) from users ");
	 while(rs.next())
	 {
		id=rs.getInt(1);
		id=id+1; 
        
	 }
 }
catch(Exception e)
{
	System.out.println(e);
}
            %> 
             
        </div>
      
        <form action="registationAction.jsp" method="post">
            
            <input type="hidden" name="accountNumber" value="<%out.println(id); %>" required>
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name">
            </div>
            
            <div class="form-group">
                <label>Father Name</label>
                <input type="text" name="fatherName">
            </div>
            
            <div class="form-group">
                <label>Mother Name</label>
                <input type="text" name="motherName">
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address">
            </div>

            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" required>
            </div>
            
            <div class="form-group">
                <label>State</label>
                <input type="text" name="state" required>
            </div>
            
            <div class="form-group">
                <label>Country</label>
                <input type="text" name="country" required>
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required >
            </div>
            
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="number" name="mobileNumber" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
  <!-- 
            <div class="form-group">
                <label>Account Number</label>
                <input type="number" name="accountNumber" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
                       -->
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>

            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" required>
            </div>

            <button type="submit" class="register-btn">Save</button>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="admin/adminHome.jsp" style="background-color: green; padding:10px 20px; color:white;" >Back</a>
        </form>
    </div>

</body>
</html>