<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Amount</title>
    <link rel="stylesheet" href="css/registation.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    

</head>
<body>

             

    <div class="form-container">
        <div class="form-header">
             Debit Amount <i class="fa-solid fa-credit-card"></i>
        
             
             <%  
             String msg=request.getParameter("msg"); 
             if("wrong".equals(msg))
             {
           %>
           <h1 style="color:red;">Incorrect Account Number or Password</h1>
           <%} %>
           
           <%
           if("invalid".equals(msg))
               {
        	   %>
          <h1 style="color:red;">Something Went Wrong! try again</h1>
             <%} %>
        
          <%
            if("no balance".equals(msg))
            {
          %>
          <h1>Sorry you don't have sufficient Balance!</h1>
          <%} %>
        </div>
        
        <form action="debitAmountAction.jsp" method="post">
            
            <div class="form-group">
                <label>Account Number</label>
                <input type="number" name="accountNumber" placeholder="Enter Account Number" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
            
            <div class="form-group">
                <label>Enter Your Amount</label>
                <input type="number" name="debit" placeholder="Enter Amount" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter Your Password" required style="flex: 1;padding: 12px;border-radius: 4px;background-color: #e9ecef;font-size: 0.9rem;">
            </div>
            <button type="submit" class="register-btn">Enter <i class="fa-solid fa-arrow-right-to-bracket"></i></button>
            &nbsp; &nbsp; &nbsp; <a href="userHome.jsp" style="background-color:red; color:white; padding:10px 25px; colro:white;"><b>back <i class="fa-solid fa-circle-arrow-left"></i></b></a>
         </form>
    </div>

</body>
</html>