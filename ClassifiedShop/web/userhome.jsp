<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
    String cname, ptype, psort;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
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

        /* General Form Styling */
        .login_table {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        /* Table Header Styling */
        .login_table thead th {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        /* Table Cell Styling */
        .login_table th, .login_table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /* General Table Styling */
        .p_tab {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        /* Table Header Styling */
        .p_tab thead th {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        /* Table Cell Styling */
        .p_tab th, .p_tab td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /* Table Row Hover Effect */
        .p_tab tr:hover {
            background-color: #f1f1f1;
        }

        /* Right-Aligned Text */
        .right {
            text-align: right;
        }

        /* Responsive Table Styling */
        @media (max-width: 768px) {
            .login_table, .p_tab {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }

        /* Button Styling */
        .btn-view, .btn-interest {
            color: #007bff;
            text-decoration: none;
        }

        .btn-view:hover, .btn-interest:hover {
            text-decoration: underline;
        }

        .center {
            text-align: center;
            margin: 20px;
        }
        .nav-link {
            display: inline-block;
            margin: 10px 10px;
            padding: 10px 20px;
            font-size: 13px;
            color: #4CAF50; /* Green color for text */
            text-decoration: none;
            border: 2px solid #4CAF50;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Hover effect for the navigation links */
        .nav-link:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h1 class="page-header">Shopping <small>...!</small></h1>

    <% 
        if(request.getParameter("submit1") == null) { 
            ps1 = conn.prepareStatement("select cname from categories");
            rs1 = ps1.executeQuery();
    %>
            <form name="f" action="userhome.jsp" method="post">
                <table class="login_table">
                    <thead>
                        <tr>
                            <th colspan="2">SEARCH PRODUCT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Select Category</th>
                            <td>
                                <select name="cname" required>
                                    <% while(rs1.next()) { %>
                                        <option value="<%= rs1.getString(1) %>"><%= rs1.getString(1) %></option>
                                    <% } %>
                                    <%
                                    ps1.close();
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Product Type</th>
                            <td>
                                <select name="ptype">
                                    <option value="new">NEW PRODUCT</option>
                                    <option value="old">OLD PRODUCT</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Sort Price By</th>
                            <td>
                                <select name="psort">
                                    <option value="asc">Low to High</option>
                                    <option value="desc">High to Low</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit1" value="Submit">
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
    <% 
        } else { 
            cname = request.getParameter("cname");
            ptype = request.getParameter("ptype");
            psort = request.getParameter("psort");
            
            if(ptype.equalsIgnoreCase("new")) {
                ps1 = conn.prepareStatement("select n.id, u.name, n.shopid, n.brand, n.modelname, n.price, n.discount, n.oprice, fn1, gmap from newproduct n, newuser u where n.shopid=u.userid and n.cname=? and n.shopid in (select userid from newuser where utype='shop' and city=?) order by n.price " + psort);
                ps1.setString(1, cname);
                ps1.setString(2, session.getAttribute("usercity").toString().trim());
            } else {
                ps1 = conn.prepareStatement("select n.id, u.name, n.sellerid, n.brand, n.modelname, n.price, n.discount, n.oprice, fn1, yr, gmap from oldproduct n, newuser u where n.sellerid=u.userid and n.cname=? and n.sellerid in (select userid from newuser where utype='seller' and city=?) order by n.price " + psort);
                ps1.setString(1, cname);
                ps1.setString(2, session.getAttribute("usercity").toString().trim());
            }
            rs1 = ps1.executeQuery();
            
            if(rs1.next()) {
                do {
                    out.print("<table class='p_tab'><tbody>");
                    out.print("<tr><th rowspan='7'><img src='uploads/" + rs1.getString(9) + "' width='100px'><th width='20%'>Shop Name<td>" + rs1.getString(2) + "</td></tr>");
                    out.print("<tr><th>Email<td>" + rs1.getString(3) + "</td></tr>");
                    out.print("<tr><th>Brand<td>" + rs1.getString(4) + "</td></tr>");
                    out.print("<tr><th>Model Name<td>" + rs1.getString(5) + "</td></tr>");
                    if(ptype.equalsIgnoreCase("old")) {
                        out.print("<tr><th>Year<td><i>" + rs1.getString(10) + "</i></td></tr>");
                    }
                    out.print("<tr><th>Price<td>Rs." + rs1.getString(6) + "</td></tr>");
                    out.print("<tr><th>Discount<td>" + rs1.getString(7) + "%</td></tr>");
                    out.print("<tr><th>Offer Price<td>Rs." + rs1.getString(8) + "</td></tr>");
                    out.print("<tr><th colspan='3'><a href='uvpinfo.jsp?pid=" + rs1.getString(1) + "&ptype=" + ptype + "' class='btn-view nav-link'>View Product Info</a> | ");
                    if(ptype.equalsIgnoreCase("new")) {
                        out.print("<a href='" + rs1.getString(10) + "' class='nav-link' target='_blank'>View Location</a>");
                    } else {
                        out.print("<a href='" + rs1.getString(11) + "' class='btn-view nav-link' target='_blank'>View Location</a>");
                    }
                    out.print(" | <a href='sendinterest.jsp?pid=" + rs1.getString(1) + "&ptype=" + ptype + "' class='btn-interest nav-link'>Send Interest</a>");
                    out.print("</tbody></table>");
                } while(rs1.next());
            } else {
                out.print("<div class='center'>No Product Available in this Category in the Selected City...!<br><a href='userhome.jsp'>Back</a></div>");
            }
            ps1.close();
        }
    %>
    <%@include file="footer.jsp" %>
</body>
</html>


<%--<%@include file="userheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String cname,ptype,psort;
%>
<h1 class="page-header">Shopping <small>...!</small></h1>
<%
    if(request.getParameter("submit1")==null) {
        ps1 = conn.prepareStatement("select cname from categories");
        rs1 = ps1.executeQuery();
%>
            <form name="f" action="userhome.jsp" method="post">
                <table class="login_tab">
                    <thead>
                        <tr>
                            <th colspan="2">SEARCH PRODUCT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Select Category</th>
                            <td>
                                <select name="cname" required>
                            <%
                                    while(rs1.next()) {
                                        out.print("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                                    }
                                    ps1.close();
                                %>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Product Type</th>
                            <td>
                                <select name="ptype">
                                    <option value="new">NEW PRODUCT</option>
                                    <option value="old">OLD PRODUCT</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Sort Price By</th>
                            <td>
                                <select name="psort">
                                    <option value="asc">Low to High</option>
                                    <option value="desc">High to Low</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit1" value="Submit">
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
<%
    } else {
            cname = request.getParameter("cname");
            ptype = request.getParameter("ptype");
            psort = request.getParameter("psort");
            if(ptype.equalsIgnoreCase("new")) {
            ps1 = conn.prepareStatement("select n.id,u.name,n.shopid,n.brand,n.modelname,n.price,n.discount,n.oprice,fn1,gmap from newproduct n,newuser u where n.shopid=u.userid and n.cname=? and n.shopid in (select userid from newuser where utype='shop' and city=?) order by n.price "+psort);
            ps1.setString(1, cname);
            ps1.setString(2, session.getAttribute("usercity").toString().trim());
            } else {
             ps1 = conn.prepareStatement("select n.id,u.name,n.sellerid,n.brand,n.modelname,n.price,n.discount,n.oprice,fn1,yr,gmap from oldproduct n,newuser u where n.sellerid=u.userid and n.cname=? and n.sellerid in (select userid from newuser where utype='seller' and city=?) order by n.price "+psort);
            ps1.setString(1, cname);
            ps1.setString(2, session.getAttribute("usercity").toString().trim());
            }
            rs1 = ps1.executeQuery();
            if(rs1.next()) {
                out.print("<table class='p_tab'><tbody>");
                out.print("<tr><th rowspan='7'><img src='uploads/"+rs1.getString(9)+"' width='100px'><th width='20%'>Shop Name<td>"+rs1.getString(2));
                out.print("<tr><th>EMail<td>"+rs1.getString(3));
                out.print("<tr><th>Brand<td>"+rs1.getString(4));
                out.print("<tr><th>Model Name<td>"+rs1.getString(5));
                if(ptype.equalsIgnoreCase("old")) {
                    out.print("&nbsp; <i>(Year : "+rs1.getString(10)+")</i>");
                }
                out.print("<tr><th>Price<td>Rs."+rs1.getString(6));
                out.print("<tr><th>Discount<td>"+rs1.getString(7)+"%");
                out.print("<tr><th>Offer Price<td>Rs."+rs1.getString(8));
                out.print("<tr><th colspan='3'><a href='uvpinfo.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>View Product Info</a> | ");
                if(ptype.equalsIgnoreCase("new"))
                out.print("<a href='"+rs1.getString(10)+"' target='_blank'>View Location</a>");
                else
                out.print("<a href='"+rs1.getString(11)+"' target='_blank'>View Location</a>");
                out.print(" | <a href='sendinterest.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>Send Interest</a>");
                out.print("</tbody></table>");
                while(rs1.next()) {
                out.print("<table class='p_tab'><tbody>");
                out.print("<tr><th rowspan='7'><img src='uploads/"+rs1.getString(9)+"' width='100px'><th width='20%'>Shop Name<td>"+rs1.getString(2));
                out.print("<tr><th>Shop EMail<td>"+rs1.getString(3));
                out.print("<tr><th>Brand<td>"+rs1.getString(4));
                out.print("<tr><th>Model Name<td>"+rs1.getString(5));
                out.print("<tr><th>Price<td>Rs."+rs1.getString(6));
                out.print("<tr><th>Discount<td>"+rs1.getString(7)+"%");
                out.print("<tr><th>Offer Price<td>Rs."+rs1.getString(8));
                out.print("<tr><th colspan='3'><a href='uvpinfo.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>View Product Info</a> | ");
                if(ptype.equalsIgnoreCase("new"))
                out.print("<a href='"+rs1.getString(10)+"'>View Location</a>");
                else
                out.print("<a href='"+rs1.getString(11)+"'>View Location</a>");
                out.print(" | <a href='sendinterest.jsp?pid="+rs1.getString(1)+"&ptype="+ptype+"'>Send Interest</a>");
                out.print("</tbody></table>");
                }
            } else {
                out.print("<div class='center'>No Product Available in this Category in the Selected City...!<br><a href='userhome.jsp'>Back</a></div>");
            }
            ps1.close();
    }  
%><%@include file="footer.jsp" %>--%>