<%@page import="servlets.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>



<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<form action="StoreRestaurant.do" method="post" enctype="multipart/form-data">
					<p  class="form-row form-row-first validate-required">
            			<label class="" >Restaurant Name <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="ABC Restaurant" id="res_name" name="res_name" class="input-text my">
             	  </p>
             	  <p  class="form-row form-row-first validate-required">
            			<label class="" >Description <abbr title="required" class="required">*</abbr>
            			</label>
               	     <textarea rows="4" cols="40"  placeholder="Restaurant Description" id="res_desc" name="res_desc" class="my1"></textarea>
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Custom Content 1 </label>
               	     <input type="text" value="" placeholder="TagLine 1" id="res_cc1" name="res_cc1" class="input-text my ">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Custom Content 2 </label>
               	     <input type="text" value="" placeholder="TagLine 2" id="res_cc2" name="res_cc2" class="input-text my">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Web Address <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="www.Restaurant.com" id="res_website" name="res_website" class="input-text my">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Browse Logo <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="file" value=""  id="logo" name="logo">
             	  </p>
				<div class="form-row place-order">
                     <input type="submit" data-value="Place order" value="Add Restaurant" id="place_order" name="woocommerce_checkout_place_order" class="btn btn-primary">
                </div>
                <div class="clear"></div>
				</form>
			</div>
			<div class="col-sm-9">				
				<!-- repeate only jumbotron -->
				<%
					ResultSet rs=DAO.listRestaurants();
					while(rs!=null && rs.next())
					{
				%>
				<div class="row jumbotron" style="margin:10px; padding:10px;">
					<div class="col-sm-3">
						<img src='Logo.do?source=restaurants&rid=<%=rs.getInt("id")%>' class="img-responsive img-thumbnail" width="120px">
					</div>
					<div class="col-sm-6">
						<h4 ><%=rs.getString("res_name") %></h4>
						<h5><%=rs.getString("res_cc1") %></h5>
						<p style="font-size:12px;"><%=rs.getString("res_desc") %><a href="#">Read more...</a></p>		
					</div>
					<div class="col-sm-3">
						<h6><a href='<%=rs.getString("res_website") %>'><%=rs.getString("res_website") %></a></h6>
						<br>
						<p>
							<a href='branches.jsp?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-cog"></span></a>&nbsp
							<a href='restaurant_edit.do?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-pencil"></span></a>&nbsp
							<a href='restaurant_edit.do?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-trash"></span></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>
