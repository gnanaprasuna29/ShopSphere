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
<h1 class="page-header">Interested <small>Users</small></h1>
<%
    if(request.getParameter("npid")!=null) {
        ps1 = conn.prepareStatement("delete from ninterest where id=?");
        ps1.setString(1, request.getParameter("npid"));
        ps1.executeUpdate();
        ps1.close();
    }
    ps1 = conn.prepareStatement("select i.id,i.dt,i.userid,n.name,n.city,n.mobile,cname,brand,modelname,oprice,fn1 from ninterest i,newuser n,newproduct p where i.userid=n.userid and i.pid=p.id and i.pid in (select id from newproduct where shopid=?)");
    ps1.setString(1, session.getAttribute("shopid").toString().trim());
    rs1 = ps1.executeQuery();
    out.print("<table class='table' style='min-width:70%;'><thead><tr><th>Date<th>User Id<th>Name<th>City<th>Mobile<th>Category<th>Brand<th>Model Name<th>Offer Price<th>Image<tbody>");
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
%><%@include file="footer.jsp" %>