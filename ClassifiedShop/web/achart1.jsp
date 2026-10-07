<%@include file="adminheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
    ps1 = conn.prepareStatement("select city,count(pid) from ninterest i,newproduct p,newuser n where i.pid=p.id and p.shopid=n.userid group by city");
    rs1 = ps1.executeQuery();
    //while(rs1.next())
    //out.print("<br>"+rs1.getString(1)+" - "+rs1.getString(2));
%>
<script type="text/javascript">
 google.load("visualization", "1", {packages:["corechart"]});
 google.setOnLoadCallback(drawChart);
 function drawChart() {
 var data = google.visualization.arrayToDataTable([
 ['City','Count'],
 <% 
	while(rs1.next()){
	out.print("['"+rs1.getString(1)+"',"+rs1.getString(2)+"],");
	}
%>
]);

var options = {
	title: 'Sales of New Products according to Cities',
	pieHole: 0.5,
	pieSliceTextStyle: {
	color: 'black',
	},
	legend: 'bottom'
};
//var chart = new google.visualization.BarChart(document.getElementById("columnchart12"));
var chart = new google.visualization.PieChart(document.getElementById("columnchart12"));
chart.draw(data,options);
}	
</script>

    <style>
        /* Center-aligned navigation styling */
        .center {
            text-align: center;
            margin: 20px 0;
        }

        /* Styling for the anchor links as buttons */
        .center a {
            color: #007bff;
            text-decoration: none;
            margin: 5px; /* Adjusted margin for mobile view */
            padding: 8px 16px;
            border: 1px solid #007bff;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
        }

        .center a:hover {
            background-color: #007bff;
            color: white;
        }

        /* Header styling */
        .page-header {
            font-size: 2rem;
            margin: 20px 0;
            border-bottom: 1px solid #e5e5e5;
            padding-bottom: 10px;
        }

        .page-header small {
            font-size: 1.5rem;
            color: #6c757d;
        }

        /* Container styling */
        .container-fluid {
            margin-top: 20px;
        }

        /* Chart styling */
        #columnchart12 {
            width: 100%;
            height: 500px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .page-header {
                font-size: 1.5rem;
            }

            .page-header small {
                font-size: 1rem;
            }

            .center a {
                padding: 6px 12px;
                font-size: 0.9rem;
                margin: 5px 0; /* Stacked margin for better spacing on smaller screens */
            }

            #columnchart12 {
                height: 300px; /* Adjusted height for smaller screens */
            }
        }

        @media (max-width: 480px) {
            .page-header {
                font-size: 1.25rem;
            }

            .page-header small {
                font-size: 0.9rem;
            }

            .center a {
                padding: 4px 8px;
                font-size: 0.8rem;
            }

            #columnchart12 {
                height: 200px; /* Further adjusted height for very small screens */
            }
        }
    </style>


    <!-- Navigation Links -->
    <div class="center">
        <a href="achart1.jsp">City Wise (New Products)</a> | 
        <a href="achart2.jsp">City Wise (Used Products)</a> | 
        <a href="achart3.jsp">Category Wise (New Products)</a> |
        <a href="achart4.jsp">Category Wise (Used Products)</a>
    </div>

    <!-- Header for the report -->
    <h1 class="page-header">City <small>Wise Report (New Products)</small></h1>

    <!-- Container for the chart -->
    <div class="container-fluid">
        <div id="columnchart12"></div>
    </div>

    <!-- Bootstrap JS -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Include chart library scripts if necessary -->


<!--<div class="center">
    <a href="achart1.jsp">City Wise (New Products)</a> | 
    <a href="achart2.jsp">City Wise (Used Products)</a> | 
    <a href="achart3.jsp">Category Wise (New Products)</a> |
    <a href="achart4.jsp">Category Wise (Used Products)</a>
</div>
<h1 class="page-header">City <small>wise Report (New Products)</small></h1>
<div class="container-fluid">
<div id="columnchart12" style="width: 100%; height: 500px;"></div>
</div>-->
<%
    ps1.close();
%><%@include file="footer.jsp" %>