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
      display: inline-block; 
      border-radius: 20px;    /* Allows padding and margin properties */
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
         table {
    width: 100%; /* Table takes up only as much width as needed */
    table-layout: auto; /* Columns dynamically adjust width based on content */
  }
    </style>
</head>

<body bgcolor='blue'>
      
<table class="leaderboard-table">
 
    <thead>
        <tr>
           
            <th><b>SNo.</b></th> 
            <th>Name</th>
            
            <th>Address</th>
            
            <th>State</th>
            
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Account Number</th>
            <th>Password</th>
            <th>Update</th>
            <th>Close</th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <%
           int id=0;
             try{
            	 Connection con=ConnectionProvider.getCon();
            	 Statement st=con.createStatement();
            	 ResultSet rs=st.executeQuery("select * from users");
            	 while(rs.next())
            	 {
            		 id=id+1;
           %> 
           <td><b><%out.println(id); %></b></td>
            <td><%=rs.getString(2) %></td>
            
            <td><%=rs.getString(5) %> </td>
            
            <td><%=rs.getString(7) %> </td>
            
            <td><%=rs.getString(9) %> </td>
            <td><%=rs.getString(10) %> </td>
            <td><%=rs.getString(1) %> </td>
            <td><%=rs.getString(11) %></td>
          <td><a href="updateAccount.jsp?accountNumber=<%=rs.getString("accountNumber")%>" style="background-color:green;"><b>Update</b></a></td>
                    
          <td><b><a href="closeAccount.jsp?accountNumber=<%=rs.getString("accountNumber")%> " style="background-color: #f44336;">Delete</a></b></td>                
        </tr>
        <%
            	 }
             }
           catch(Exception e)
           {
        	   System.out.println(e);
           }
        %>
    </tbody>
</table>

</body>
</html>