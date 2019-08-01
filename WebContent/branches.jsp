<%@page import="servlets.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<form action="StoreBranch.do" method="post" enctype="multipart/form-data">
				<p  class="form-row form-row-first validate-required">
            			<label class="" >Restaurant <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="restaurant" id="restaurant" class="selectpicker my">
						<%
						if(request.getMethod().equalsIgnoreCase("get"))
						{
						ResultSet rs=DAO.listRestaurants(Integer.parseInt(request.getParameter("id")));
						while(rs.next())
						{
						%>
						<option value="<%=rs.getInt("ID")%>"><%=rs.getString("res_name") %></option>
						<%}} %>
						</select>
						</p>
					<p  class="form-row form-row-first validate-required">
            			<label class="" >Branch Name <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="ABC Restaurant" id="branch_name" name="branch_name" class="input-text my">
             	  </p>
             	 <p class="form-row form-row-first validate-required">
            			<label class="" >Email <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="eg. abc@restaurant.com" id="branch_email" name="branch_email" class="input-text my">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Phone # </label>
               	     <input type="text" value="" placeholder="eg. 9632587410" id="branch_phone" name="branch_phone" class="input-text my ">
             	  </p>             	  
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Web Address <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="www.Restaurant.com" id="branch_website" name="branch_website" class="input-text my">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Status </label>
               	     <input type="radio" value="" id="branch_status" name="branch_status" class="radio-inline">Active
               	     <input type="radio" value="" id="branch_status" name="branch_status" class="radio-inline">Inactive
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Browse Logo <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="file" value=""  id="logo" name="logo">
             	  </p>
				<div class="form-row place-order">
                     <input type="submit" data-value="Place order" value="Add Branch" id="place_order" name="woocommerce_checkout_place_order" class="btn btn-primary">
                </div>
                <div class="clear"></div>
				</form>
			</div>
			<div class="col-sm-9">				
				<!-- repeate only jumbotron -->
				<%
					ResultSet rs=DAO.listBranches(Integer.parseInt(request.getParameter("id")));
					
				
					while(rs!=null && rs.next())
					{
				%>
				<div class="row jumbotron" style="margin:10px; padding:10px;">
					<div class="col-sm-3">
						<img src='Logo.do?source=branch&rid=<%=rs.getInt("id")%>' class="img-responsive img-thumbnail" width="120px">
					</div>
					<div class="col-sm-6">
						<h4 ><%=rs.getString("branch_name") %></h4>
						<h5><b><%=rs.getBoolean("branch_status") ?"Inactive":"Active" %></b></h5>
						<p style="font-size:12px;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<%=rs.getString("branch_email") %></p>	
						<p style="font-size:12px;"><span class="glyphicon glyphicon-phone"></span>&nbsp;<%=rs.getString("branch_phone") %></p>	
					</div>
					<div class="col-sm-3">
						<h6><a href='<%=rs.getString("branch_website") %>'><%=rs.getString("branch_website") %></a></h6>
						<br>
						<p>
							<ul class="nav navbar-nav">
            					<li class="dropdown">
                    				<a style="font-size:20px; margin-top:-15px; float:left" data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="glyphicon glyphicon-cog"></span></a>
                    				<ul role="menu" class="dropdown-menu">
                        				<li><a href="address.jsp?id=<%=rs.getInt("id")%>">Address</a></li>
	                        			<li><a href="#">Time Table</a></li>
    				                    <li><a href="menu.jsp?id=<%=rs.getInt("id")%>">Menu</a></li>
                    				</ul>
                				</li>
            				</ul>
            				<a href='restaurant_edit.do?rid=<%=rs.getInt("id")%>' style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp
							<a href='restaurant_delete.do?rid=<%=rs.getInt("id")%>' style="font-size:20px;"><span class="glyphicon glyphicon-trash"></span></a>
						</p>
					</div> 
					
				</div>
				<%} %>
				<!-- <ul class="pagination" style="float: right;">
    				<li><a href="#">1</a></li>
    				<li><a href="#">2</a></li>
    				<li><a href="#">3</a></li>
    				<li><a href="#">4</a></li>
    				<li><a href="#">5</a></li>
    				<li><a href="#">5</a></li>
    				<li><a href="#">5</a></li>
    				<li><a href="#">5</a></li>
    				<li><a href="#">5</a></li>
  				</ul> -->
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>
