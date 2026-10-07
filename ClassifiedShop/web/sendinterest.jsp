<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String pid,ptype,dt;
%>
<h1 class="page-header">Shopping <small>...!</small></h1>
<%
    pid = request.getParameter("pid");
    ptype = request.getParameter("ptype");
    dt = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
    try {
    if(ptype.equalsIgnoreCase("new")) {
        ps1 = conn.prepareStatement("insert into ninterest(dt,userid,pid) values(?,?,?)");
        ps1.setString(1, dt);
        ps1.setString(2, session.getAttribute("userid").toString().trim());
        ps1.setString(3, pid);
        ps1.executeUpdate();
        ps1.close();
    } else {
        ps1 = conn.prepareStatement("insert into ointerest(dt,userid,pid) values(?,?,?)");
        ps1.setString(1, dt);
        ps1.setString(2, session.getAttribute("userid").toString().trim());
        ps1.setString(3, pid);
        ps1.executeUpdate();
        ps1.close();
    }
    } catch(Exception e) {}
    out.print("<div class='center'>Interest Send Successfully...!<br><a href='userhome.jsp'>Back</a></div>");
%><%@include file="footer.jsp" %>