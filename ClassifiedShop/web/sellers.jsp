<%@include file="header.jsp" %><%!
    PreparedStatement ps=null;
    ResultSet rs=null;
    String userid,pwd,utype;
%>
<h1 class="page-header">Seller <small>Login</small></h1>
<%
    if(request.getParameter("submit1")==null) {
%>

    <title>Seller Login</title>
    <style>
        /* Styling the login table */
        .login_tab {
            width: 300px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        /* Styling the table header */
        .login_tab thead th {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 18px;
        }

        /* Styling table cells */
        .login_tab th, .login_tab td {
            padding: 10px;
            text-align: left;
        }

        /* Styling input fields */
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Styling the submit button */
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Hover effect for submit button */
        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Responsive adjustments */
        @media (max-width: 400px) {
            .login_tab {
                width: 90%;
            }
        }

        /* Additional styling for the registration link */
        .login_tab tfoot a {
            color: #4CAF50;
            text-decoration: none;
        }

        /* Hover effect for the registration link */
        .login_tab tfoot a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form name="f" action="sellers.jsp" method="post">
        <table class="login_tab">
            <thead>
                <tr>
                    <th colspan="2">SELLER LOGIN</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>UserId</th>
                    <td><input type="text" name="userid" required autofocus></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><input type="password" name="pwd" required></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit1" value="Login">
                        <br>
                        Don't You Have an Id? <a href="sregn.jsp">Register Here</a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>


<!--            <form name="f" action="sellers.jsp" method="post">
                <table class="login_tab">
                    <thead>
                        <tr>
                            <th colspan="2">SELLER LOGIN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>UserId</th>
                            <td><input type="text" name="userid" required autofocus></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><input type="password" name="pwd" required></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit1" value="Login">
                                <br>
                                Don't You Have an Id ? <a href="sregn.jsp">Register Here</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>-->
<%
    } else {                   
            ps = conn.prepareStatement("select * from newuser where userid=? and pwd=? and utype='seller'");
            ps.setString(1, request.getParameter("userid"));
            ps.setString(2, request.getParameter("pwd"));
            rs = ps.executeQuery();
            if(rs.next()) {
                session.setAttribute("sellerid", request.getParameter("userid"));
                response.sendRedirect("sellerhome.jsp");
            } else {
                out.print("<div class='center'>Invalid Userid/Password <br><a href='sellers.jsp'>Back</a></div>");
            }
            ps.close();
    }  
%><%@include file="footer.jsp" %>