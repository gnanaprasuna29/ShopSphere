<%@include file="sellerheader.jsp" %><%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
    String cname, brand, modelname, specs, price, discount, oprice;
    int k = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product</title>
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

        .login_table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #f9f9f9;
            border-radius: 8px;
            overflow: hidden;
        }

        .login_table thead th {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: left;
        }

        .login_table th, .login_table td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .login_table tr:hover {
            background-color: #f1f1f1;
        }

        .right {
            text-align: right;
            margin-bottom: 10px;
        }

        .center {
            text-align: center;
            margin-top: 20px;
        }

        .input-file {
            border: 1px solid #ccc;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1 class="page-header">Upload <small>Product</small></h1>
    <%
        if (request.getParameter("submit1") == null) {
            ps1 = conn.prepareStatement("SELECT cname FROM categories");
            rs1 = ps1.executeQuery();
    %>
        <div class="text-right mb-3">
            <a href="slvproducts.jsp" class="btn btn-outline-info">View Products</a>
        </div>
        <form name="f" action="sellerhome1.jsp" method="post" enctype="multipart/form-data">
            <table class="login_table">
                <thead>
                    <tr>
                        <th colspan="2">UPLOAD PRODUCT</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Product Category *</th>
                        <td>
                            <select name="cname" required>
                                <%
                                    while (rs1.next()) {
                                        out.print("<option value='" + rs1.getString(1) + "'>" + rs1.getString(1) + "</option>");
                                    }
                                    ps1.close();
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Brand Name *</th>
                        <td><input type="text" name="brand" required autofocus></td>
                    </tr>
                    <tr>
                        <th>Model Name *</th>
                        <td><input type="text" name="modelname" required></td>
                    </tr>
                    <tr>
                        <th>Product Specifications *</th>
                        <td><textarea name="specs" cols="30" rows="3" required></textarea></td>
                    </tr>
                    <tr>
                        <th>Price *</th>
                        <td><input type="text" name="price" required pattern="\d+(\.\d{1,2})?"></td>
                    </tr>
                    <tr>
                        <th>Discount %  *</th>
                        <td><input type="text" name="discount" required pattern="\d+(\.\d{1,2})?"></td>
                    </tr>
                    <tr>
                        <th>Manufacture Year *</th>
                        <td><input type="text" name="yr" required pattern="\d{4}" placeholder="2023" maxlength="4"></td>
                    </tr>
                    <tr>
                        <th>Product Image 1 *</th>
                        <td><input type="file" name="img1" class="input-file" required></td>
                    </tr>
                    <tr>
                        <th>Product Image 2 *</th>
                        <td><input type="file" name="img2" class="input-file" required></td>
                    </tr>
                    <tr>
                        <th>Product Image 3 *</th>
                        <td><input type="file" name="img3" class="input-file" required></td>
                    </tr>
                    <tr>
                        <th>Product Image 4 *</th>
                        <td><input type="file" name="img4" class="input-file" required></td>
                    </tr>
                    <tr>
                        <th>Product Image 5 *</th>
                        <td><input type="file" name="img5" class="input-file"></td>
                    </tr>
                    <tr>
                        <th>Google Map URL  *</th>
                        <td><textarea name="gmap" cols="30" required></textarea></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="submit1" value="Create">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    <%
        } else {
            cname = request.getParameter("cname");
            brand = request.getParameter("brand");
            modelname = request.getParameter("modelname");
            specs = request.getParameter("specs");
            price = request.getParameter("price");
            discount = request.getParameter("discount");

            // Calculate offer price
            java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
            nf.setMaximumFractionDigits(0);
            float discPrice = Float.parseFloat(price) - (Float.parseFloat(price) * Float.parseFloat(discount) / 100);
            oprice = nf.format(discPrice);

            // Insert product
            ps1 = conn.prepareStatement(
                "INSERT INTO newproducts (shopid, cname, brand, modelname, specs, price, discount, oprice) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps1.setString(1, session.getAttribute("shopid").toString().trim());
            ps1.setString(2, cname);
            ps1.setString(3, brand);
            ps1.setString(4, modelname);
            ps1.setString(5, specs);
            ps1.setString(6, price);
            ps1.setString(7, discount);
            ps1.setString(8, oprice);

            try {
                k = ps1.executeUpdate();
                if (k > 0) {
                    out.print("<div class='center'>Product Stored!<br><a href='shophome.jsp'>Back</a></div>");
                } else {
                    out.print("<div class='center'>Duplicate Product Name!<br><a href='shophome.jsp'>Back</a></div>");
                }
            } catch (Exception e) {
                out.print("<div class='center'>Error occurred while storing the product.<br><a href='shophome.jsp'>Back</a></div>");
            } finally {
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
    String cname,brand,modelname,specs,price,discount,oprice;
    int k=0;
%>
<h1 class="page-header">Upload <small>Product</small></h1>
<%
    if(request.getParameter("submit1")==null) {
        ps1 = conn.prepareStatement("select cname from categories");
        rs1 = ps1.executeQuery();
%>
<div class="right">
    <a href="slvproducts.jsp">View Products</a>
</div>
<form name="f" action="sellerhome1.jsp" method="post" enctype="multipart/form-data">
                <table class="login_tab" style="width:40%;">
                    <thead>
                        <tr>
                            <th colspan="2">UPLOAD PRODUCT</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th width="40%">Product Category</th>
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
                            <th>Brand Name</th>
                            <td><input type="text" name="brand" required autofocus></td>   
                        </tr>
                        <tr>
                            <th>Model Name</th>
                            <td><input type="text" name="modelname" required></td>   
                        </tr>
                        <tr>
                            <th>Product <br>Specifications</th>
                            <td><textarea name="specs" cols="30" rows="3" required></textarea></td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td><input type="text" name="price" required pattern="\d+"></td>   
                        </tr>
                        <tr>
                            <th>Discount %</th>
                            <td><input type="text" name="discount" required pattern="\d+(\.\d+)?"></td>
                        </tr>
                        <tr>
                            <th>Manufacture Year</th>
                            <td><input type="text" name="yr" required pattern="\d{4}" placeholder="2023" maxlength="4"></td>   
                        </tr>
                        <tr>
                            <th>Product Image 1</th>
                            <td><input type="file" name="img1" required></td>   
                        </tr>
                        <tr>
                            <th>Product Image 2</th>
                            <td><input type="file" name="img2" required></td>   
                        </tr>
                        <tr>
                            <th>Product Image 3</th>
                            <td><input type="file" name="img3" required></td>   
                        </tr>
                        <tr>
                            <th>Product Image 4</th>
                            <td><input type="file" name="img4" required></td>   
                        </tr>
                        <tr>
                            <th>Product Image 5</th>
                            <td><input type="file" name="img5"></td>   
                        </tr>
                        <tr>
                            <th>Google Map URL</th>
                            <td><textarea name="gmap" cols="30" required></textarea></td>   
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit1" value="Create">
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
<%
    } else {
            cname = request.getParameter("cname");
            brand = request.getParameter("brand");
            modelname = request.getParameter("modelname");
            specs = request.getParameter("specs");
            price = request.getParameter("price");
            discount = request.getParameter("discount");
            java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
            nf.setMaximumFractionDigits(0);
            float disc_price = Float.parseFloat(price)-(Float.parseFloat(price)*Float.parseFloat(discount)/100);
            oprice = nf.format(disc_price);
            ps1 = conn.prepareStatement("insert into newproducts(shopid,cname,brand,modelname,specs,price,discount,oprice) values(?,?,?,?,?,?,?,?)");
            ps1.setString(1, session.getAttribute("shopid").toString().trim());
            ps1.setString(2, cname);
            ps1.setString(3, brand);
            ps1.setString(4, modelname);
            ps1.setString(5, specs);
            ps1.setString(6, price);
            ps1.setString(7, discount);
            ps1.setString(8, oprice);
        try {
            k = ps1.executeUpdate();
        } catch(Exception e) {}
                if(k>0)
                out.print("<div class='center'>Product Stored...!<br><a href='shophome.jsp'>Back</a></div>");
                else
                out.print("<div class='center'>Duplicate Product Name...!<br><a href='shophome.jsp'>Back</a></div>");
            ps1.close();
    }  
%><%@include file="footer.jsp" %>--%>