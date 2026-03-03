<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        :root {
            --primary-blue: #2c5ba9;
            --accent-green: #4caf50;
            --light-blue-bg: #e3f2fd;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-blue-bg);
            overflow-x: hidden;
        }

        /* Top Navigation */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            background: transparent;
        }

        .logo-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: var(--accent-green);
            font-weight: bold;
            font-size: 12px;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--primary-blue);
            margin-left: 30px;
            font-weight: 600;
        }

        /* Main Hero Container */
        .hero {
            display: flex;
            height: 80vh;
            position: relative;
        }

        /* Left Side Content */
        .content {
            flex: 1;
            padding: 50px 8%;
            z-index: 2;
        }

        h1 {
            color: var(--primary-blue);
            font-size: 80px;
            margin: 0;
            line-height: 0.9;
        }

        .sub-heading {
            color: #5da9dd;
            font-size: 45px;
            margin-bottom: 20px;
        }

        p {
            color: #666;
            max-width: 300px;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .btn-learn {
            background-color: var(--accent-green);
            color: white;
            padding: 10px 25px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
        }

        /* Graphics in the Middle */
        .graphics-container {
            position: absolute;
            left: 45%;
            top: 50%;
            transform: translate(-50%, -50%);
            z-index: 3;
        }

        /* Right Side Image & Shape */
        .image-side {
            flex: 1;
            position: relative;
            background: url('https://images.unsplash.com/photo-1563013544-824ae1b704d3?auto=format&fit=crop&w=800&q=80');
            background-size: cover;
            background-position: center;
        }

        /* The Green Diagonal Divider */
        .image-side::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100px;
            width: 150px;
            height: 100%;
            background-color: var(--accent-green);
            transform: skewX(-30deg);
            z-index: 1;
        }

        /* Overlay to lighten the image area slightly */
        .image-side::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>

      <%
        String account=session.getAttribute("accountNumber").toString();
        try{
        	Connection con=ConnectionProvider.getCon();
        	Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("Select * from users where accountNumber='"+account+"' ");
            while(rs.next())
            {
      %>

    <nav>
      
        <div class="nav-links">
            <a href="#"><i class="fa-solid fa-user"></i><%out.println("Account="+account); %></a>
            <a><i class="fa-solid fa-certificate"></i><%="Name="+rs.getString(1) %></a>
            <a href="userHome.jsp"><i class="fa-solid fa-house-chimney-user"></i>Home</a>
            <a href="debitAmount.jsp"><i class="fa-solid fa-credit-card"></i>Debit</a>
            <a href="creditAmount.jsp"><i class="fa-solid fa-credit-card"></i>Credit</a>
            <a href="checkBalance.jsp"><i class="fa-solid fa-coins"></i>Check Balance</a>
            
            <a href="profileDetails.jsp"><i class="fa-solid fa-address-card"></i>Profile</a>
            <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
        </div>
    </nav>

    <div class="hero">
        <div class="content">
            <span style="color: var(--primary-blue); font-size: 32px;">India New</span>
            <h1>BANK</h1>
            <div class="sub-heading">Save Your Money</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
            <a href="#" class="btn-learn">Learn More</a>
        </div>

        <div class="graphics-container">
            <svg width="250" height="300" viewBox="0 0 200 250">
                <rect x="20" y="20" width="120" height="200" rx="20" fill="white" stroke="#2c5ba9" stroke-width="5"/>
                <circle cx="80" cy="90" r="40" fill="#4caf50" />
                <path d="M60 90 L75 105 L105 75" fill="none" stroke="white" stroke-width="8" stroke-linecap="round"/>
                <rect x="90" y="110" width="100" height="60" rx="10" fill="#2196f3" />
                <rect x="90" y="125" width="100" height="10" fill="#0d47a1" />
            </svg>
        </div>

        <div class="image-side"></div>
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