<%@include file="shopheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
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
        .table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        .table thead th {
            background-color: #6EACDA;
            color: white;
            padding: 15px;
            text-align: left;
        }
</style>
<h1 class="page-header">Products <small>List</small></h1>
<%
    if(request.getParameter("did")!=null) {
        ps1 = conn.prepareStatement("delete from newproduct where id=?");
        ps1.setString(1, request.getParameter("did"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select * from newproduct where shopid=? order by cname");
    ps1.setString(1, session.getAttribute("shopid").toString().trim());
    rs1 = ps1.executeQuery();
%>

<div class="container">
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Brand</th>
                    <th>Model Name</th>
                    <th>Specification</th>
                    <th>Price</th>
                    <th>Discount</th>
                    <th>Image</th>
                    <th>Task</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while(rs1.next()) {        
                        out.print("<tr>");
                        out.print("<td>" + rs1.getString(3) + "</td>");
                        out.print("<td>" + rs1.getString(4) + "</td>");
                        out.print("<td>" + rs1.getString(5) + "</td>");
                        out.print("<td>" + rs1.getString(6) + "</td>");
                        out.print("<td>" + rs1.getString(7) + "</td>");
                        out.print("<td>" + rs1.getString(8) + "</td>");
                        out.print("<td class='text-center'><img src='uploads/" + rs1.getString(11) + "' class='img-thumbnail' width='100px'></td>");
                        out.print("<td class='text-center'><a href='shvproducts.jsp?did=" + rs1.getString(1) + "' class='btn btn-danger btn-sm' onclick=\"return confirm('Are you sure you want to delete this product?')\">Delete</a></td>");
                        out.print("</tr>");
                    }
                    ps1.close();
                %>
            </tbody>
        </table>
    </div>
</div>
<%@include file="footer.jsp" %>


<%--<%@include file="shopheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<h1 class="page-header">Products <small>List</small></h1>
<%
    if(request.getParameter("did")!=null) {
        ps1 = conn.prepareStatement("delete from newprouct where id=?");
        ps1.setString(1, request.getParameter("did"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select * from newproduct where shopid=? order by cname");
    ps1.setString(1, session.getAttribute("shopid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='report_tab' style='min-width:70%;'><thead><tr><th>Category<th>Brand<th>Model Name<th>Specification<th>Price<th>Discount<th>Image1<th>Task<tbody>");
    while(rs1.next()) {        
            out.print("<tr><td>"+rs1.getString(3));
            out.print("<td>"+rs1.getString(4));
            out.print("<td>"+rs1.getString(5));
            out.print("<td>"+rs1.getString(6));
            out.print("<td>"+rs1.getString(7));
            out.print("<td>"+rs1.getString(8));
            out.print("<td class='center'><img src='uploads/"+rs1.getString(11)+"' width='50px'>");
            out.print("<td class='right'><a href='shvproducts.jsp?did="+rs1.getString(1)+"' onclick=\"javascript:return confirm('Are You Sure to Delete ?')\">Delete</a>");
    }
    out.print("</table>");
    ps1.close();
    %><%@include file="footer.jsp" %>--%>