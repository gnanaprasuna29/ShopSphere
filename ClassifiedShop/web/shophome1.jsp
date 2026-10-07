<%@page import="java.util.*,java.io.*"%><%@include file="shopheader.jsp" %><%!
    PreparedStatement ps1=null;
    ResultSet rs1=null;
    String shopid,cname,brand,modelname,specs,price,discount,gmap,oprice;
    Map<String, String> map1,map2;
%>
<h1 class="page-header">New <small>Upload</small></h1>
<%
    com.oreilly.servlet.MultipartRequest mrequest = new com.oreilly.servlet.MultipartRequest(request, getServletContext().getRealPath("/uploads"), 10*1024*1024);

    String fn1="",fn2="",fn3="",fn4="",fn5="";
    int k=0;
    File img1 = mrequest.getFile("img1");
    if(img1!=null) {
        File temp1 = new File(img1.getParent()+"/"+(new java.util.Date().getTime()/1000)+img1.getName());
        img1.renameTo(temp1);
        fn1 = temp1.getName();
    }
    File img2 = mrequest.getFile("img2");
    if(img2!=null) {
        File temp1 = new File(img2.getParent()+"/"+(new java.util.Date().getTime()/1000)+img2.getName());
        img2.renameTo(temp1);
        fn2 = temp1.getName();
    }
    File img3 = mrequest.getFile("img3");
    if(img3!=null) {
        File temp1 = new File(img3.getParent()+"/"+(new java.util.Date().getTime()/1000)+img3.getName());
        img3.renameTo(temp1);
        fn3 = temp1.getName();
    }
    File img4 = mrequest.getFile("img4");
    if(img4!=null) {
        File temp1 = new File(img4.getParent()+"/"+(new java.util.Date().getTime()/1000)+img4.getName());
        img4.renameTo(temp1);
        fn4 = temp1.getName();
    }
    File img5 = mrequest.getFile("img5");
    if(img5!=null) {
        File temp1 = new File(img5.getParent()+"/"+(new java.util.Date().getTime()/1000)+img5.getName());
        img5.renameTo(temp1);
        fn5 = temp1.getName();
    }
    shopid = session.getAttribute("shopid").toString().trim();
    cname = mrequest.getParameter("cname");
    brand = mrequest.getParameter("brand");
    modelname = mrequest.getParameter("modelname");
    specs = mrequest.getParameter("specs");
    price = mrequest.getParameter("price");
    discount = mrequest.getParameter("discount");
    gmap = mrequest.getParameter("gmap");
    java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
    nf.setMaximumFractionDigits(0);
    nf.setGroupingUsed(false);
    float disc_price = Float.parseFloat(price)-(Float.parseFloat(price)*Float.parseFloat(discount)/100);
    oprice = nf.format(disc_price);
    ps1 = conn.prepareStatement("insert into newproduct(shopid,cname,brand,modelname,specs,price,discount,oprice,gmap,fn1,fn2,fn3,fn4,fn5) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps1.setString(1, shopid);
            ps1.setString(2, cname);
            ps1.setString(3, brand);
            ps1.setString(4, modelname);
            ps1.setString(5, specs);
            ps1.setString(6, price);
            ps1.setString(7, discount);
            ps1.setString(8, oprice);
            ps1.setString(9, gmap);
            ps1.setString(10, fn1);
            ps1.setString(11, fn2);
            ps1.setString(12, fn3);
            ps1.setString(13, fn4);
            ps1.setString(14, fn5);
        try {
            k = ps1.executeUpdate();
        } catch(Exception e) {
            out.print(e.toString());
        }
                if(k>0)
                out.print("<div class='center'>Product Stored...!<br><a href='shophome.jsp'>Back</a></div>");
                else
                out.print("<div class='center'>Duplicate Product Name...!<br><a href='shophome.jsp'>Back</a></div>");
            ps1.close();
  %>
<%@include file="footer.jsp" %>