<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Category</title>
    <style>
        .page-header {
            font-size: 2rem;
            margin-bottom: 20px;
            border-bottom: 2px solid #dc3545;
            padding-bottom: 10px;
        }

        .page-header small {
            font-size: 1.5rem;
            color: #6c757d;
        }

        /* General Table Styling */
        .report_table {
            width: 70%;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
            margin: 20px auto; /* Centering the table horizontally */
            max-width: 800px;
        }

        /* Table Header Styling */
        .report_table thead th {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: left;
            font-size: 20px;
        }

        /* Table Cell Styling */
        .report_table th, .report_table td {
            padding: 20px;
            text-align: left;
            border-bottom: 2px solid #ddd;
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
</head>
<body>
    <h1 class="page-header">View <small>Category</small></h1>
    <%
        if(request.getParameter("cn") != null) {
            ps1 = conn.prepareStatement("delete from categories where cname=?");
            ps1.setString(1, request.getParameter("cn"));
            ps1.executeUpdate();
            ps1.close();
        }
        ps1 = conn.prepareStatement("select * from categories");
        rs1 = ps1.executeQuery();
    %>
    <table class="report_table">
        <thead>
            <tr>
                <th>Category Name</th>
                <th>Task</th>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs1.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs1.getString(1) + "</td>");
                    out.print("<td class='right'><a href='avcategory.jsp?cn=" + rs1.getString(1) + "' class='btn-delete' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a></td>");
                    out.print("</tr>");
                }
                ps1.close();
            %>
        </tbody>
    </table>
    <%@include file="footer.jsp" %>
</body>
</html>


<%--<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<h1 class="page-header">View <small>Category</small></h1>
<%
    if(request.getParameter("cn")!=null) {
        ps1 = conn.prepareStatement("delete from categories where cname=?");
        ps1.setString(1, request.getParameter("cn"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select * from categories");
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:30%;'><thead><tr><th>Category Name<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(1));
            out.print("<td class='right'><a href='avcategory.jsp?cn="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
    }
    out.print("</table>");
    ps1.close();
    %><%@include file="footer.jsp" %>--%>