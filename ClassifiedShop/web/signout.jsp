<%
    if(session.getAttribute("userid")!=null) {
        session.removeAttribute("userid");
    }
    if(session.getAttribute("adminuserid")!=null) {
        session.removeAttribute("adminuserid");
    }
    if(session.getAttribute("sellerid")!=null) {
        session.removeAttribute("sellerid");
    }
    if(session.getAttribute("shopid")!=null) {
        session.removeAttribute("shopid");
    }
    response.sendRedirect("index.jsp");
    %>