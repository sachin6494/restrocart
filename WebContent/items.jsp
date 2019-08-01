<%@page import="servlets.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<form action="StoreItem.do" method="post" enctype="multipart/form-data">
				<p  class="form-row form-row-first validate-required">
            			<label class="" >Menu Category <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="item_category" id="item_category" class="selectpicker my">
						<%
						if(request.getMethod().equalsIgnoreCase("get"))
						{
						ResultSet rs=DAO.listMenus(Integer.parseInt(request.getParameter("id")));
						while(rs.next())
						{
						%>
						<option value="<%=rs.getInt("ID")%>"><%=rs.getString("menu_name") %></option>
						<%}} %>
						</select>
						</p>
					<p  class="form-row form-row-first validate-required">
            			<label class="" >Item Name <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="eg. Chicken Korma" id="item_name" name="item_name" class="input-text my">
             	  </p>
             	 <p class="form-row form-row-first validate-required">
            			<label class="" >Description <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="Description" id="item_description" name="item_description" class="input-text my">
             	  </p>
             	  <p class="form-row form-row-first validate-required">
            			<label class="" >Price </label>
               	     <input type="text" value="0.00" placeholder="eg.500.00" id="item_price" name="item_price" class="input-text my ">
             	  </p>      
             	  <p  class="form-row form-row-first validate-required">
            			<label class="" >Unit <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="item_unit" id="item_unit" class="selectpicker my">
						<%
						if(request.getMethod().equalsIgnoreCase("get"))
						{
						ResultSet rs=DAO.listUnits();
						while(rs.next())
						{
						%>
						<option value="<%=rs.getInt("ID")%>"><%=rs.getString("unit_name") %></option>
						<%}} %>
						</select>
						</p>       	  
             	 <p  class="form-row form-row-first validate-required">
            			<label class="" >Delivery Type <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="item_delivery_type" id="item_delivery_type" class="selectpicker my">
						
						<option value="Delivery">Delivery</option>
						<option value="Pickup">Pickup</option>
						<option value="Both" selected>Both</option>						
						</select>
						</p>
					<p class="form-row form-row-first validate-required">
            			<label class="" >Browse Picture <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="file" value=""  id="logo" name="logo">
             	  </p>
				<div class="form-row place-order">
                     <input type="submit" data-value="Place order" value="Add Item" id="place_order" name="woocommerce_checkout_place_order" class="btn btn-primary">
                </div>
                <div class="clear"></div>
				</form>
			</div>
			<div class="col-sm-9">				
				<!-- repeate only jumbotron -->
				<%
					ResultSet rs=DAO.listItems(Integer.parseInt(request.getParameter("id")));
					
				
					while(rs!=null && rs.next())
					{
				%>
				<div class="row jumbotron" style="margin:10px; padding:10px;">
					<div class="col-sm-3">
						<img src='Logo.do?source=items&rid=<%=rs.getInt("id")%>' class="img-responsive img-thumbnail" width="120px">
					</div>
					<div class="col-sm-6">
						<h4 ><%=rs.getString("item_name") %></h4>
						<h5>Description : <%=rs.getString("item_description")%></h5>
						<h5>Delivery :<%=rs.getString("item_delivery_type")%></h4>
						<h5>Price/Unit : Rs. <%=rs.getString("item_price")%> / <%=rs.getString("unit_name")%></h5>
<%-- 						<p style="font-size:12px;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<%=rs.getString("branch_email") %></p>	
						<p style="font-size:12px;"><span class="glyphicon glyphicon-phone"></span>&nbsp;<%=rs.getString("branch_phone") %></p>	 --%>
					</div>
					<div class="col-sm-3">
						<%-- <h6><a href='<%=rs.getString("branch_website") %>'><%=rs.getString("branch_website") %></a></h6> --%>
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
