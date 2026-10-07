<%@include file="sellerheader.jsp" %><%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products List</title>
    <style>
        .page-header {
            font-size: 2rem;
            margin-bottom: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        .page-header small {
            font-size: 1.5rem;
            color: #6c757d;
        }

        .report_tab {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        .report_tab thead th {
            background-color: #6EACDA;
            color: white;
            padding: 15px;
            text-align: left;
        }

        .report_tab th, .report_tab td {
            padding: 15px;
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

        .input-file {
            border: 1px solid #ccc;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1 class="page-header">Products <small>List</small></h1>
    <%
        try {
            if (request.getParameter("did") != null) {
                ps1 = conn.prepareStatement("DELETE FROM oldproduct WHERE id = ?");
                ps1.setString(1, request.getParameter("did"));
                ps1.executeUpdate();
                ps1.close();
                out.print("<div class='center'>Product Deleted Successfully!<br><a href='slvproducts.jsp'>Back to Products List</a></div>");
            }

            ps1 = conn.prepareStatement("SELECT * FROM oldproduct WHERE sellerid = ? ORDER BY cname");
            ps1.setString(1, session.getAttribute("sellerid").toString().trim());
            rs1 = ps1.executeQuery();

            out.print("<table class='report_tab'>");
            out.print("<thead><tr><th>Brand<th>Model Name<th>Specification<th>Price<th>Discount<th>Manf. Year<th>Image<th>Task</thead>");
            out.print("<tbody>");
            while (rs1.next()) {
                out.print("<tr>");
                out.print("<td>" + rs1.getString(4) + "</td>");
                out.print("<td>" + rs1.getString(5) + "</td>");
                out.print("<td>" + rs1.getString(6) + "</td>");
                out.print("<td>" + rs1.getString(7) + "</td>");
                out.print("<td>" + rs1.getString(8) + "</td>");
                out.print("<td>" + rs1.getString(9) + "</td>");
                out.print("<td class='center'><img src='uploads/" + rs1.getString(12) + "' width='50px'></td>");
                out.print("<td class='right'><a href='slvproducts.jsp?did=" + rs1.getString(1) + "' onclick=\"return confirm('Are you sure you want to delete this product?')\">Delete</a></td>");
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
<h1 class="page-header">Products <small>List</small></h1>
<%
    if(request.getParameter("did")!=null) {
        ps1 = conn.prepareStatement("delete from oldprouct where id=?");
        ps1.setString(1, request.getParameter("did"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select * from oldproduct where sellerid=? order by cname");
    ps1.setString(1, session.getAttribute("sellerid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Brand<th>Model Name<th>Specification<th>Price<th>Discount<th>Manf. Year<th>Image1<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td>"+rs1.getString(9));
            out.print("<td class='center'><img src='uploads/"+rs1.getString(12)+"' width='50px'>");
            out.print("<td class='right'><a href='slvproducts.jsp?did="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
    }
    out.print("</table>");
    ps1.close();
    %><%@include file="footer.jsp" %>--%>