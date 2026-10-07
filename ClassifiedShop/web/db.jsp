<%@page import="java.sql.*"%><%!
    Connection conn=null;
%><%
    Class.forName("com.mysql.jdbc.Driver");
    if(conn==null) {
        conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp_ocs","root","");
    }
%>