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
    ps1 = conn.prepareStatement("select cname,count(pid) from ointerest n,oldproduct p where n.pid=p.id group by cname");
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
	title: 'Sales of Used Products by Categories',
	pieHole: 0.5,
        colors: ['green', 'purple'],
	pieSliceTextStyle: {
	color: 'black',        
	},
	legend: 'bottom'
};
var chart = new google.visualization.ColumnChart(document.getElementById("columnchart12"));
chart.draw(data,options);
}	
</script>
<div class="center">
    <a href="achart1.jsp">City Wise (New Products)</a> | 
    <a href="achart2.jsp">City Wise (Used Products)</a> | 
    <a href="achart3.jsp">Category Wise (New Products)</a> |
    <a href="achart4.jsp">Category Wise (Used Products)</a>
</div>
<h1 class="page-header">Category <small>wise Report (New Products)</small></h1>
<div class="container-fluid">
<div id="columnchart12" style="width: 100%; height: 500px;"></div>
</div>
<%
    ps1.close();
%><%@include file="footer.jsp" %>