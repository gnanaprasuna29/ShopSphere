<%@include file="sellerheader.jsp" %><%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interested Users</title>
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

        .report_table {
            width: 70%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        .report_table thead th {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
        }

        .report_table th, .report_table td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .report_table tr:hover {
            background-color: #f1f1f1;
        }

        .center {
            text-align: center;
        }

        .input-file {
            border: 1px solid #ccc;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1 class="page-header">Interested <small>Users</small></h1>
    <%
        try {
            if (request.getParameter("npid") != null) {
                ps1 = conn.prepareStatement("DELETE FROM ninterest WHERE id = ?");
                ps1.setString(1, request.getParameter("npid"));
                ps1.executeUpdate();
                ps1.close();
            }

            ps1 = conn.prepareStatement(
                "SELECT i.id, i.dt, i.userid, n.name, n.city, n.mobile, p.cname, p.brand, p.modelname, p.oprice, p.fn1 " +
                "FROM ointerest i " +
                "JOIN newuser n ON i.userid = n.userid " +
                "JOIN oldproduct p ON i.pid = p.id " +
                "WHERE p.sellerid = ?");
            ps1.setString(1, session.getAttribute("sellerid").toString().trim());
            rs1 = ps1.executeQuery();

            out.print("<table class='report_table'>");
            out.print("<thead><tr><th>Date<th>User Id<th>Name<th>City<th>Mobile<th>Category<th>Brand<th>Model Name<th>Offer Price<th>Image</thead>");
            out.print("<tbody>");
            while (rs1.next()) {
                out.print("<tr>");
                out.print("<td>" + rs1.getString(2) + "</td>");
                out.print("<td>" + rs1.getString(3) + "</td>");
                out.print("<td>" + rs1.getString(4) + "</td>");
                out.print("<td>" + rs1.getString(5) + "</td>");
                out.print("<td>" + rs1.getString(6) + "</td>");
                out.print("<td>" + rs1.getString(7) + "</td>");
                out.print("<td>" + rs1.getString(8) + "</td>");
                out.print("<td>" + rs1.getString(9) + "</td>");
                out.print("<td>" + rs1.getString(10) + "</td>");
                out.print("<td class='center'><img src='uploads/" + rs1.getString(11) + "' width='50px'></td>");
                out.print("</tr>");
            }
            out.print("</tbody></table>");
        } catch (Exception e) {
            out.print("<div class='center'>Error occurred while fetching data.<br><a href='sellerhome.jsp'>Back</a></div>");
        } finally {
            if (ps1 != null) {
                ps1.close();
            }
        }
    %>
    <%@include file="footer.jsp" %>
</body>
</html>


<%--<%@include file="sellerheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<h1 class="page-header">Interested <small>Users</small></h1>
<%
    if(request.getParameter("npid")!=null) {
        ps1 = conn.prepareStatement("delete from ninterest where id=?");
        ps1.setString(1, request.getParameter("npid"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select i.id,i.dt,i.userid,n.name,n.city,n.mobile,cname,brand,modelname,oprice,fn1 from ointerest i,newuser n,oldproduct p where i.userid=n.userid and i.pid=p.id and i.pid in (select id from oldproduct where sellerid=?)");
    ps1.setString(1, session.getAttribute("sellerid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Date<th>User Id<th>Name<th>City<th>Mobile<th>Category<th>Brand<th>Model Name<th>Offer Price<th>Image<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td>"+rs1.getString(9));
            out.print("<td>"+rs1.getString(10));
            out.print("<td class='center'><img src='uploads/"+rs1.getString(11)+"' width='50px'>");
    }
    out.print("</table>");
    ps1.close();
%><%@include file="footer.jsp" %>--%>