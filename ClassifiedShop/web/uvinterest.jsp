<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interested Products</title>
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

        .report_tab {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        .report_tab thead th {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        .report_tab th, .report_tab td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .report_tab tr:hover {
            background-color: #f1f1f1;
        }

        .center {
            text-align: center;
        }

        .right {
            text-align: right;
        }

        .btn-remove {
            color: #dc3545;
            text-decoration: none;
        }

        .btn-remove:hover {
            text-decoration: underline;
        }

        .btn-img {
            width: 50px;
        }
    </style>
</head>
<body>
    <h1 class="page-header">Interested <small>New Products</small></h1>
    <%
        if (request.getParameter("npid") != null) {
            ps1 = conn.prepareStatement("DELETE FROM ninterest WHERE id=?");
            ps1.setString(1, request.getParameter("npid"));
            ps1.executeUpdate();
            ps1.close();
        }

        if (request.getParameter("opid") != null) {
            ps1 = conn.prepareStatement("DELETE FROM ointerest WHERE id=?");
            ps1.setString(1, request.getParameter("opid"));
            ps1.executeUpdate();
            ps1.close();
        }

        ps1 = conn.prepareStatement(
            "SELECT i.id, i.dt, cname, brand, modelname, price, oprice, name, mobile, fn1 " +
            "FROM ninterest i " +
            "JOIN newproduct p ON i.pid = p.id " +
            "JOIN newuser n ON p.shopid = n.userid " +
            "WHERE i.userid = ?");
        ps1.setString(1, session.getAttribute("userid").toString().trim());
        rs1 = ps1.executeQuery();

        out.print("<table class='report_tab'><thead><tr>");
        out.print("<th>Date<th>Category<th>Brand<th>Model Name<th>Price<th>Offer Price<th>Shop Name<th>Mobile<th>Image<th>Task<tbody>");
        
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>" + rs1.getString(2) + "</td>");
            out.print("<td>" + rs1.getString(3) + "</td>");
            out.print("<td>" + rs1.getString(4) + "</td>");
            out.print("<td>" + rs1.getString(5) + "</td>");
            out.print("<td>Rs." + rs1.getString(6) + "</td>");
            out.print("<td>Rs." + rs1.getString(7) + "</td>");
            out.print("<td>" + rs1.getString(8) + "</td>");
            out.print("<td>" + rs1.getString(9) + "</td>");
            out.print("<td class='center'><img src='uploads/" + rs1.getString(10) + "' class='btn-img'></td>");
            out.print("<td class='right'><a href='vuinterest.jsp?npid=" + rs1.getString(1) + "' class='btn-remove' onclick=\"return confirm('Are you sure to remove?')\">Remove</a></td>");
            out.print("</tr>");
        }
        out.print("</table>");
        ps1.close();
    %>

    <h1 class="page-header">Interested <small>Used Products</small></h1>
    <%
        ps1 = conn.prepareStatement(
            "SELECT i.id, i.dt, cname, brand, modelname, price, oprice, name, mobile, fn1 " +
            "FROM ointerest i " +
            "JOIN oldproduct p ON i.pid = p.id " +
            "JOIN newuser n ON p.sellerid = n.userid " +
            "WHERE i.userid = ?");
        ps1.setString(1, session.getAttribute("userid").toString().trim());
        rs1 = ps1.executeQuery();

        out.print("<table class='report_tab'><thead><tr>");
        out.print("<th>Date<th>Category<th>Brand<th>Model Name<th>Price<th>Offer Price<th>Owner Name<th>Mobile<th>Image<th>Task<tbody>");
        
        while (rs1.next()) {
            out.print("<tr>");
            out.print("<td>" + rs1.getString(2) + "</td>");
            out.print("<td>" + rs1.getString(3) + "</td>");
            out.print("<td>" + rs1.getString(4) + "</td>");
            out.print("<td>" + rs1.getString(5) + "</td>");
            out.print("<td>Rs." + rs1.getString(6) + "</td>");
            out.print("<td>Rs." + rs1.getString(7) + "</td>");
            out.print("<td>" + rs1.getString(8) + "</td>");
            out.print("<td>" + rs1.getString(9) + "</td>");
            out.print("<td class='center'><img src='uploads/" + rs1.getString(10) + "' class='btn-img'></td>");
            out.print("<td class='right'><a href='vuinterest.jsp?opid=" + rs1.getString(1) + "' class='btn-remove' onclick=\"return confirm('Are you sure to remove?')\">Remove</a></td>");
            out.print("</tr>");
        }
        out.print("</table>");
        ps1.close();
    %>

    <%@include file="footer.jsp" %>
</body>
</html>


<%--<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<h1 class="page-header">Interested <small>New Products</small></h1>
<%
    if(request.getParameter("npid")!=null) {
        ps1 = conn.prepareStatement("delete from ninterest where id=?");
        ps1.setString(1, request.getParameter("npid"));
        ps1.executeUpdate();
        ps1.close();
    }
    if(request.getParameter("opid")!=null) {
        ps1 = conn.prepareStatement("delete from ointerest where id=?");
        ps1.setString(1, request.getParameter("opid"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select i.id,i.dt,cname,brand,modelname,price,oprice,name,mobile,fn1 from ninterest i,newproduct p,newuser n where i.pid=p.id and p.shopid=n.userid and i.userid=?");
    ps1.setString(1, session.getAttribute("userid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Date<th>Category<th>Brand<th>Model Name<th>Price<th>Offer Price<th>Shop Name<th>Mobile<th>Image<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td>"+rs1.getString(9));
            out.print("<td class='center'><img src='uploads/"+rs1.getString(10)+"' width='50px'>");
            out.print("<td class='right'><a href='vuinterest.jsp?npid="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Remove ?')\">Remove</a>");
    }
    out.print("</table>");
    ps1.close();
%>
<h1 class="page-header">Interested <small>Used Products</small></h1>
<%
    ps1 = conn.prepareStatement("select i.id,i.dt,cname,brand,modelname,price,oprice,name,mobile,fn1 from ointerest i,oldproduct p,newuser n where i.pid=p.id and p.sellerid=n.userid and i.userid=?");
    ps1.setString(1, session.getAttribute("userid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Date<th>Category<th>Brand<th>Model Name<th>Price<th>Offer Price<th>Owner Name<th>Mobile<th>Image<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(2));
            out.print("<td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td>"+rs1.getString(9));
            out.print("<td class='center'><img src='uploads/"+rs1.getString(10)+"' width='50px'>");
            out.print("<td class='right'><a href='vuinterest.jsp?opid="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Remove ?')\">Remove</a>");
    }
    out.print("</table>");
    ps1.close();
%><%@include file="footer.jsp" %>--%>