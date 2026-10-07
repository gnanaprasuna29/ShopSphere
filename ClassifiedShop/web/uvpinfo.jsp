<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String pid,ptype;
%>
<h1 class="page-header">Shopping <small>...!</small></h1>
<%
    pid = request.getParameter("pid");
    ptype = request.getParameter("ptype");
    if(ptype.equalsIgnoreCase("new")) {
        ps1 = conn.prepareStatement("select * from newproduct where id=?");
        ps1.setString(1, pid);
        rs1 = ps1.executeQuery();
        rs1.next();
        out.print("<table class='p_tab1'>");
        out.print("<tr><th colspan='4' rowspan='7'><img src='uploads/"+rs1.getString(11)+"' class='mwi'><th>Category<td>"+rs1.getString(3));
        out.print("<tr><th>Brand<td>"+rs1.getString(4));
        out.print("<tr><th>Modelname<td>"+rs1.getString(5));
        out.print("<tr><th>Specs<td>"+rs1.getString(6));
        out.print("<tr><th>Price<td>Rs."+rs1.getString(7));
        out.print("<tr><th>Discount<td>"+rs1.getString(8)+"%");
        out.print("<tr><th>Offer Price<td>Rs."+rs1.getString(9));
        out.print("<tr><th><img src='uploads/"+rs1.getString(12)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(13)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(14)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(15)+"' width='50px'>");
        out.print("<th colspan='2' class='right'><a href='"+rs1.getString(10)+"' target='_blank'>View Location</a> | <a href='sendinterest.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>Send Interest</a>");
        out.print("</table>");
        ps1.close();
    } else {
        ps1 = conn.prepareStatement("select * from oldproduct where id=?");
        ps1.setString(1, pid);
        rs1 = ps1.executeQuery();
        rs1.next();
        out.print("<table class='p_tab1'>");
        out.print("<tr><th colspan='4' rowspan='7'><img src='uploads/"+rs1.getString(12)+"' class='mwi'><th>Category<td>"+rs1.getString(3));
        out.print("<tr><th>Brand<td>"+rs1.getString(4));
        out.print("<tr><th>Modelname<td>"+rs1.getString(5));
        if(ptype.equalsIgnoreCase("old")) {
                    out.print("&nbsp; <i>(Year : "+rs1.getString(9)+")</i>");
        }
        out.print("<tr><th>Specs<td>"+rs1.getString(6));
        out.print("<tr><th>Price<td>Rs."+rs1.getString(7));
        out.print("<tr><th>Discount<td>"+rs1.getString(8)+"%");
        out.print("<tr><th>Offer Price<td>Rs."+rs1.getString(10));
        out.print("<tr><th><img src='uploads/"+rs1.getString(13)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(14)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(15)+"' width='50px'>");
        out.print("<th><img src='uploads/"+rs1.getString(16)+"' width='50px'>");
        out.print("<th colspan='2' class='right'><a href='sendinterest.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>Send Interest</a>");
        out.print("</table>");
        ps1.close();
    }
%><%@include file="footer.jsp" %>