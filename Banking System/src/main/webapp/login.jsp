<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Here</title>
    
    <link rel="stylesheet" href="css/registation.css">
        
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
</head>
<body>

             

    <div class="form-container">
        <div class="form-header">
            <i class="fa-solid fa-right-to-bracket"> Login Here
        
             
             <%  
             String msg=request.getParameter("msg"); 
             if("not exist".equals(msg))
             {
           %>
           <h1 style="color:red;">Incorrect Username or Password</h1>
           <%} %>
           
           <%
           if("invalid".equals(msg))
           { 
           %>
         <h1>Some thing Went Wrong! Try Again !</h1>
          <%} %>
             
        </div>
        
        <form action="LoginAction.jsp" method="post">
            
            <div class="form-group">
                <label>Account Number</label>
                <input type="number" name="accountNumber" placeholder="Enter Account Number" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter Your Password" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
            <button type="submit" class="register-btn">Save</button>
            &nbsp; &nbsp; &nbsp; <a href="home.html" style="background-color:red; padding:10px 25px; colro:white;"><b>back</b></a>
         </form>
    </div>

</body>
</html>