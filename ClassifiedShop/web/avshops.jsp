<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>

    <title>Admin Home</title>
    <style>
        /* Centering and styling the navigation container */
        .nav-center {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Styling the navigation links */
        .nav-link {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            color: #4CAF50; /* Green color for text */
            text-decoration: none;
            border: 2px solid #4CAF50;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Hover effect for the navigation links */
        .nav-link:hover {
            background-color: #4CAF50;
            color: white;
        }

        /* Styling the page header */
        .page-header {
            text-align: center;
            font-size: 2em;
            margin-bottom: 30px;
            color: #333;
            border-bottom: 2px solid #4CAF50;
            display: inline-block;
            padding-bottom: 10px;
        }

        /* Styling the small text in the header */
        .page-header small {
            font-size: 0.6em;
            color: #888;
        }
    </style>

    <!-- Navigation Links -->
    <div class="nav-center">
        <a href="adminhome.jsp" class="nav-link">Users List</a>
        <a href="avsellers.jsp" class="nav-link">Sellers List</a>
        <a href="avshops.jsp" class="nav-link">Shop List</a>
    </div>

    <!-- Page Header -->
    <h1 class="page-header">Shops <small>List</small></h1>


<!--<center>
    <a href="adminhome.jsp" class="btn-outline-success">Users List</a> |
    <a href="avsellers.jsp" class="btn-outline-success">Sellers List</a> |
    <a href="avshops.jsp" class="btn-outline-success">Shop List</a>
</center>
<h1 class="page-header">Shops <small>List</small></h1>-->

    <title>View Shops</title>
    <style>
        /* General Table Styling */
        .report_table {
            width: 70%;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
            margin: 20px auto; /* Centering the table horizontally */
            max-width: 1000px;
        }

        /* Table Header Styling */
        .report_table thead th {
            background-color: #FABC3F;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        /* Table Cell Styling */
        .report_table th, .report_table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /* Table Row Hover Effect */
        .report_table tr:hover {
            background-color: #f1f1f1;
        }

        /* Right-Aligned Text */
        .right {
            text-align: right;
        }

        /* Responsive Table Styling */
        @media (max-width: 768px) {
            .report_table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }

        /* Button Styling */
        .btn-delete {
            color: #dc3545;
            text-decoration: none;
        }

        .btn-delete:hover {
            text-decoration: underline;
        }
    </style>

    <%
        if(request.getParameter("duserid") != null) {
            ps1 = conn.prepareStatement("delete from newuser where userid=?");
            ps1.setString(1, request.getParameter("duserid"));
            ps1.executeUpdate();
            ps1.close();
        }
        ps1 = conn.prepareStatement("select * from newuser where utype='shop'");
        rs1 = ps1.executeQuery();
    %>
    <table class="report_table">
        <thead>
            <tr>
                <th>Shop Name</th>
                <th>Address</th>
                <th>Area</th>
                <th>City</th>
                <th>Mobile</th>
                <th>UserId</th>
                <th>Task</th>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs1.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs1.getString(1) + "</td>");
                    out.print("<td>" + rs1.getString(2) + "</td>");
                    out.print("<td>" + rs1.getString(3) + "</td>");
                    out.print("<td>" + rs1.getString(4) + "</td>");
                    out.print("<td>" + rs1.getString(5) + "</td>");
                    out.print("<td>" + rs1.getString(6) + "</td>");
                    out.print("<td class='right'><a href='avshops.jsp?duserid=" + rs1.getString(6) + "' class='btn-delete' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a></td>");
                    out.print("</tr>");
                }
                ps1.close();
            %>
        </tbody>
    </table>
    <%@include file="footer.jsp" %>



<%--
    if(request.getParameter("duserid")!=null) {
        ps1 = conn.prepareStatement("delete from newuser where userid=?");
        ps1.setString(1, request.getParameter("duserid"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select * from newuser where utype='shop'");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Shop Name<th>Address<th>Area<th>City<th>Mobile<th>UserId<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(1));
            out.print("<td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td class='right'><a href='avshops.jsp?duserid="+rs1.getString(6)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
    }
    out.print("</table>");
    ps1.close();
    %><%@include file="footer.jsp" --%>