<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps=null;
    ResultSet rs=null;
    String userid,pwd,utype;
    int k=0;
%>
<h1 class="page-header">New <small>Category</small></h1><!--
<%
    if(request.getParameter("submit1")==null) {
%>


    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Bootstrap CSS -->
    <style>
        /* Container styling for margin and padding */
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header styling */
        .page-header {
            font-size: 2rem;
            margin-bottom: 20px;
            border-bottom: 1px solid #e5e5e5;
            padding-bottom: 10px;
        }

        .page-header small {
            font-size: 1.2rem;
            color: #6c757d;
        }

        /* Right-aligned link styling */
        .text-right {
            text-align: right;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        /* Styling for the anchor link as a button */
        .btn-outline-info {
            color: #17a2b8;
            border: 1px solid #17a2b8;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-outline-info:hover {
            background-color: #17a2b8;
            color: white;
        }

        /* Table styling */
        .table-bordered {
            width: 100%;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            background-color: #fff;
        }

        /* Header styling within the table */
        .thead-dark th {
            background-color: #343a40;
            color: #fff;
            text-align: center;
        }

        /* Form input field styling */
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
        }

        /* Button styling */
        .btn-success {
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
    </style>

    <div class="container my-4">

        <!-- Right-aligned link to view categories -->
        <div class="text-right mb-3">
            <a href="avcategory.jsp" class="btn btn-outline-info">View Categories</a>
        </div>
        
        <!-- Form for adding a new category -->
        <form name="f" action="category.jsp" method="post" class="form-horizontal">
            <table class="table table-bordered login_tab">
                <thead class="thead-dark">
                    <tr>
                        <th colspan="2" class="text-center">NEW CATEGORY</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Category Name</th>
                        <td>
                            <input type="text" name="cname" class="form-control" required autofocus>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="text-center">
                            <input type="submit" name="submit1" value="Create" class="btn btn-success">
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
    <script src="js/bootstrap.min.js"></script> <!-- Bootstrap JS -->


<!--
<div class="right">
    <a href="avcategory.jsp">View Categories</a>
</div>
            <form name="f" action="category.jsp" method="post">
                <table class="login_tab">
                    <thead>
                        <tr>
                            <th colspan="2">NEW CATEGORY</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Category Name</th>
                            <td><input type="text" name="cname" required autofocus></td>
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
            </form>-->
<%
    } else {                   
            ps = conn.prepareStatement("insert into categories(cname) values(?)");
            ps.setString(1, request.getParameter("cname"));
        try {
            k = ps.executeUpdate();
        } catch(Exception e) {}
                if(k>0)
                out.print("<div class='center'>Category Created...!<br><a href='category.jsp'>Back</a></div>");
                else
                out.print("<div class='center'>Duplicate Category Name...!<br><a href='category.jsp'>Back</a></div>");
            ps.close();
    }  
%><%@include file="footer.jsp" %>