<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Name</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

      <style>
      form {
    width: 300px; /* or a percentage, e.g., 50% */
    margin: 0 auto; /* sets top/bottom margin to 0, left/right to auto */
}
      
      
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Navbar Container */
        nav {
            background-color: #1e88e5; /* The blue shade from your image */
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Logo / Branding */
        .logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        /* Navigation Links */
        .nav-links {
            list-style: none;
            display: flex;
            gap: 25px; /* Spacing between the links */
        }

        .nav-links li a {
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        /* Hover effect */
        .nav-links li a:hover {
            color: #ffffff;
            text-shadow: 0 0 5px rgba(255,255,255,0.5);
        }
        .form-group{
        input[type="text"] {
         width: 100%;
         padding: 12px 20px;
         margin: 8px 0;
         display: inline-block;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
          }
        }
        .register-btn{
         background-color: blue;
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
    transition: background 0.3s;
        }
    </style>
  
</head>
<body bgcolor='lightblue'>
          <nav>
        <a href="userHome.jsp" class="logo" style="background-color:red; padding:5px 10px;"><i class="fa-solid fa-circle-left"></i>Back</a>
        <ul class="nav-links">
            <li><a href="profileDetails.jsp"><i class="fa-solid fa-user"></i>Profile</a></li>
            <li><a href="changeName.jsp"><i class="fa-solid fa-pen-to-square"></i>Change Name</a></li>
            <li><a href="changeAddress.jsp"><i class="fa-solid fa-pen-to-square"></i>Change Address</a></li>
            <li><a href="changeMobileandEmail.jsp"><i class="fa-solid fa-pen-to-square"></i>Change Email & Mobile Number</a></li>
            <li><a href="changePassword.jsp"><i class="fa-solid fa-pen-to-square"></i>Change Password</a></li>
        </ul>
    </nav>
    
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
            <center><h1 style="background-color:lightpink;color:black;">Change Name</h1></center><br>
              <%
     String msg=request.getParameter("msg");
     if("changed".equals(msg))
     {
   %>
    <center><h1 style="color:gree;">Name has been Changed...</h1></center>
  <%} %>
  <%
  if("not changed".equals(msg))
  {
  %>
  <center><h1 style="color:red;">Sorry Something went wrong!</h1></center>
  <%} %>
          
        </div>
        
        <form action="changeNameAction.jsp" method="post">
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%=rs.getString(2)%>">
            </div>
            
            <div class="form-group">
                <label>Father Name</label>
                <input type="text" name="fatherName" value="<%=rs.getString(3)%>">
            </div>
            
            <div class="form-group">
                <label>Mother Name</label>
                <input type="text" name="motherName" value="<%=rs.getString(4)%>">
            </div>
            
            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" value="<%=rs.getString(12)%>">
            </div>

            
            <button type="submit" class="register-btn">Save</button>
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
