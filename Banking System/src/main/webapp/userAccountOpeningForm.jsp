<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Open Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
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
             <i class="fa-solid fa-user-plus"></i> Account Opening Form
        
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
             
        </div>
        
        <form action="userAccountOpeningFormAction.jsp" method="post">
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" required>
            </div>
            
            <div class="form-group">
                <label>Father Name</label>
                <input type="text" name="fatherName" required>
            </div>
            
            <div class="form-group">
                <label>Mother Name</label>
                <input type="text" name="motherName" required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" required>
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
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="number" name="mobileNumber" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>

            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" required>
            </div>

            <button type="submit" class="register-btn">Save <i class="fa-solid fa-floppy-disk"></i></button>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="login.jsp" style="background-color: green; padding:10px 20px;border-radius: 20px; color:white;" >Login<i class="fa-solid fa-right-to-bracket"></i></a>
            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="home.html" style="background-color: red; padding:10px 20px; border-radius: 20px; color:white;" >Back<i class="fa-solid fa-circle-arrow-left"></i></a>
            
        </form>
    </div>

</body>
</html>