<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

      <style>
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
          String accountNumber=session.getAttribute("accountNumber").toString();
               //String accountNumber=request.getParameter("accountNumber");
          
              try{
            	  Connection con=ConnectionProvider.getCon();
                  Statement st=con.createStatement();
                  ResultSet rs=st.executeQuery("select*from users where accountNumber='"+accountNumber+"' ");
                  while(rs.next())
                  {    
          %>
         <!--  <a href="userHome.jsp" style="background-color:red; padding:10px 20px; color:black;"><b>Back</b></a>  -->
          <h1 style="text-align:center; background-color:pink; color:black;"><i class="fa-solid fa-user-doctor"></i><u>Profile Details</u></h1><br>
          <h2 style=" text-align:center;color:white;"><i class="fa-solid fa-chess-queen"></i>Name: <%=rs.getString(2) %></h2><br>
          <h2 style=" text-align:center;color:white;"><i class="fa-solid fa-envelope-circle-check"></i>Email: <%=rs.getString(9) %></h2><br>
          <h2 style=" text-align:center;color:white;"><i class="fa-solid fa-mobile"></i>Mobile Number: <%=rs.getString(10) %></h2><br>
          <h2 style=" text-align:center;color:white;"><i class="fa-solid fa-building-columns"></i>Account Number: <%=rs.getString(1) %></h2><br>
          
          
          
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