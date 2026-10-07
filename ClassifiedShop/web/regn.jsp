<%@include file="header.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String name,addr,aname,city,mobile,userid,pwd;
%>
<h1 class="page-header">User <small>Registration</small></h1>
<%
    if(request.getParameter("submit1")==null) {
        ps1 = conn.prepareStatement("select city from cities");
        rs1 = ps1.executeQuery();
%>

    <title>User Signup</title>
    <style>
        /* Styling the signup table */
        .login_tab {
            width: 500px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        /* Styling the table header */
        .login_tab thead th {
            background-color: #2196F3; /* Changed to blue for the signup form */
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

        /* Styling input fields, textarea, and select */
        input[type="text"], input[type="password"], select, textarea {
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
            background-color: #2196F3; /* Changed to blue */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        /* Hover effect for submit button */
        input[type="submit"]:hover {
            background-color: #1976D2; /* Darker blue on hover */
        }

        /* Responsive adjustments */
        @media (max-width: 400px) {
            .login_tab {
                width: 90%;
            }
        }
    </style>
    <script>
        function check() {
            // Add any form validation checks here if needed
            return true;
        }
    </script>

    <form name="f" action="regn.jsp" method="post" onsubmit="return check()">
        <table class="login_tab">
            <thead>
                <tr>
                    <th colspan="2">USER SIGNUP</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Name *</th>
                    <td><input type="text" name="name" required autofocus></td>   
                </tr>
                <tr>
                    <th>Address *</th>
                    <td><textarea name="addr" required></textarea></td>
                </tr>
                <tr>
                    <th>Area Name *</th>
                    <td><input type="text" name="aname" required></td>   
                </tr>
                <tr>
                    <th>City *</th>
                    <td>
                        <select name="city" required>
                            <% while(rs1.next()) {
                                out.print("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                            }
                            ps1.close(); %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Mobile *</th>
                    <td><input type="text" name="mobile" required maxlength="10"></td>
                </tr>
                <tr>
                    <th>Email *(User Id)</th>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <th>Password *</th>
                    <td><input type="password" name="pwd" required></td>
                </tr>                    
                <tr>
                    <th>Confirm Password *</th>
                    <td><input type="password" name="cpwd" required></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit1" value="Register">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>




<!--<form name="f" action="regn.jsp" method="post" onsubmit="return check()">
            <table class="login_tab">
                <thead>
                    <tr>
                        <th colspan="2">USER SIGNUP</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Name</th>
                        <td><input type="text" name="name" required autofocus></td>   
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><textarea name="addr" required></textarea></td>
                    </tr>
                    <tr>
                        <th>Area Name</th>
                        <td><input type="text" name="aname" required></td>   
                    </tr>
                    <tr>
                        <th>City</th>
                        <td><select name="city" required>
                           
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td><input type="text" name="mobile" required maxlength="10"></td>
                    </tr>
                    <tr>
                        <th>EMail (User Id)</th>
                        <td><input type="text" name="email" required></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><input type="password" name="pwd" required></td>
                    </tr>                    
                    <tr>
                        <th>Confirm Pwd</th>
                        <td><input type="password" name="cpwd" required></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="submit1" value="Register">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>-->
<%
    } else {
        name = request.getParameter("name");
        addr = request.getParameter("addr");
        aname = request.getParameter("aname");
        city = request.getParameter("city");
        mobile = request.getParameter("mobile");
        userid = request.getParameter("email");
        pwd = request.getParameter("pwd");
int k=0;
        
        ps1 = conn.prepareStatement("insert into newuser(name,addr,aname,city,mobile,userid,pwd) values (?,?,?,?,?,?,?)");
    ps1.setString(1, name);
    ps1.setString(2, addr);
    ps1.setString(3, aname);
    ps1.setString(4, city);
    ps1.setString(5, mobile);
    ps1.setString(6, userid);
    ps1.setString(7, pwd);
try {
    k = ps1.executeUpdate();
} catch(Exception e) {}
    ps1.close();
    if(k>0)
    out.print("<div class='center'>User Id generated Successfully...!<br><a href='user.jsp'>Login</a></div>");
    else
    out.print("<div class='center'>Duplicate Id...! Try Again...!<br><a href='regn.jsp'>Register</a></div>");
    }
%>
<script>
    function check() {
        var m = f.mobile.value
        var e = f.email.value
        var pw = f.pwd.value
        var cp = f.cpwd.value
        
        var mp = /^[9876]\d{9}$/
        var ep = /^\w+\.{0,1}\w+\@\w+\.([a-z]{3}|[a-z]{2}\.[a-z]{2}){1}$/
        
        if(!m.match(mp)) {
            alert("Invalid Mobile Number")
            f.mobile.focus()
            return false
        }
        if(!e.match(ep)) {
            alert("Invalid EMail Id")
            f.email.focus()
            return false
        }
        if(pw!=cp) {
            alert("Confirm Password not Match")
            f.cpwd.focus()
            return false;
        }
        return true;
    }
</script>
<%@include file="footer.jsp" %>