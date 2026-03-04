<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
    <style>
    
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            padding: 50px;
        }
  
  a:link, a:visited {
       /* Red background for unvisited/visited links */
      color: white;              /* White text color */
      padding: 15px 25px;        /* Add padding to make the background visible and look like a button */
      text-align: center;
      text-decoration: none;     /* Remove default underline */
      display: inline-block;     /* Allows padding and margin properties */
    }

    /* State when the user mouses over the link */
    a:hover {
      background-color: #555;    /* Darker gray background on hover */
    }

    /* State the moment the link is clicked */
    a:active {
      background-color: #000;    /* Black background when active/clicked */
    }

        .leaderboard-table {
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
            background-color: white;
            border-radius: 8px 8px 0 0;
            overflow: hidden; /* Ensures the rounded corners show */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .leaderboard-table thead tr {
            background-color: #2b7a78; /* The teal color from your image */
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        .leaderboard-table th,
        .leaderboard-table td {
            padding: 15px 20px;
        }

        .leaderboard-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        /* Styling for the Name and Team columns to look like links */
        .leaderboard-table td:nth-child(2),
        .leaderboard-table td:nth-child(4) {
            color: #3a8fb7;
            cursor: pointer;
        }

        /* Alternating row colors for better readability */
        .leaderboard-table tbody tr:nth-of-type(even) {
            background-color: #f9f9f9;
        }

        .leaderboard-table tbody tr:last-of-type {
            border-bottom: 2px solid #2b7a78;
        }

        .points {
            color: #555;
        }
    </style>
</head>

<body>
  <%
       String an=session.getAttribute("accountNumber").toString();
       String pass=request.getParameter("password");
       int check=0;
       try{
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	  // ResultSet rs=st.executeQuery("select * from users inner join account where users.accountNumber=account.accountNumber and users.accountNumber='"+an+"' and users.password='"+pass+"' ");
             ResultSet rs=st.executeQuery("select * from users where accountNumber='"+an+"' and password='"+pass+"'");
    	  if(rs.next())
           {     
        	  
  %>
  
  <nav>
      <a href="userHome.jsp" style="color:black; background-color:red;"><b>Back</b></a> &nbsp; &nbsp;
  </nav>
<table class="leaderboard-table">
 
    <thead>
        <tr>
           <!--  <th>SNo.</th>  -->
           
            <th>Name</th>
            <th>Account Number</th>
            <th>Email</th>
            <th>Mobile Number</th>            
            <th>Balance</th>
            
            
        </tr>
    </thead>
    <tbody>
        <tr>
           
            <td><%=rs.getString(1) %></td>
            
            <td><%=rs.getString(10) %></td>
            
            <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td>$<%=rs.getString(13) %></td>
            
          </tr>      
    </tbody>
</table>
<%
           }
else
{
	response.sendRedirect("checkBalance.jsp?msg=wrong");
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>