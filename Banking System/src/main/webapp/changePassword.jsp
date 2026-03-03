

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
             Change Name
              <%
     String msg=request.getParameter("msg");
     if("not mached".equals(msg))
     {
   %>
    <h1>Password not matched</h1>
  <%} %>
  
  <%
    if("changed".equals(msg))
    {
  %>
  <h1>Successfully Changed</h1>
  <%} %>
  
  <%
  if("wrong".equals(msg))
  {
  %>
  <h1>Sorry Something went wrong!</h1>
  <%} %>
          
        </div>
        
        <form action="changePasswordAction.jsp" method="post">
            
            <div class="form-group">
                <label>Old Password</label>
                <input type="text" name="oldPassword" value="" placeholder="Enter Old Password" required>
            </div>
            
            <div class="form-group">
                <label>New Password</label>
                <input type="text" name="newPassword" placeholder="Enter New Passowrd" required>
            </div>
            
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="text" name="confirmPassword" placeholder="Enter Again" required>
            </div>
          
            <button type="submit" class="register-btn">Save</button>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="profileDetails.jsp" style="background-color: green; padding:10px 20px; color:white;" >Back</a>
        </form>
    </div>
   
</body>
</html>