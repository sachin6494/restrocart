<%@page import="servlets.DAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RestroKart</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script>	
 
      function init_map() {
		var var_location = new google.maps.LatLng(45.430817,12.331516);
 
        var var_mapoptions = {
          center: var_location,
          zoom: 14
        };
 
		var var_marker = new google.maps.Marker({
			position: var_location,
			map: var_map,
			title:"Venice"});
 
        var var_map = new google.maps.Map(document.getElementById("map-container"),
            var_mapoptions);
 
		var_marker.setMap(var_map);	
 
      }
 
      google.maps.event.addDomListener(window, 'load', init_map);
 
    </script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#address_state").change(function(){
		var sid=$("select#address_state").val();
		$.get("citylist.jsp",{address_state:sid},function(response){
			$("select#address_city").html(response);
		});
	});
	
});



</script>
<style type="text/css">
	.my
	{
		width:100%;
		height: 30px;
	}	
	.my1
	{
		width:100%;
		
	}	
</style>

</head>
<body>

	 <nav role="navigation" class="navbar navbar-default">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand"><img src="img/restaurant.jpg" width="70px" class="img-responsive" style="margin-top:-30px"></a>
        </div>
        <!-- Collection of nav links, forms, and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Dashboard</a></li>
                <li><a href="#">Reports</a></li>
                <li><a href="#">Tracking</a></li>
                <li><a href="#">Orders</a></li>
            </ul>
            <form role="search" class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" placeholder="Search" class="form-control">
                </div>
            </form>
             
            <ul class="nav navbar-nav navbar-right">
            	<li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Settings <b class="caret"></b></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="state.jsp">State & City</a></li>   
                           <li><a href="unit.jsp">Unit</a></li>                                           
                    </ul>
                </li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Admin <b class="caret"></b></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">Change Password</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>