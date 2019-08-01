<%@page import="servlets.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<form action="StoreAddress.do" method="post">
				<p  class="form-row form-row-first validate-required form-group">
            			<label class="" >Branch <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="branch" id="branch" class="selectpicker my">
						<%
						if(request.getMethod().equalsIgnoreCase("get"))
						{
						ResultSet rs=DAO.getBranch(Integer.parseInt(request.getParameter("id")));
						while(rs.next())
						{
						%>
						<option value="<%=rs.getInt("ID")%>"><%=rs.getString("branch_name") %></option>
						<%}} %>
						</select>
						</p>
					<p  class="form-row form-row-first validate-required">
            			<label class="" >Address Line 1 <abbr title="required" class="required">*</abbr>
            			</label>
               	     	<input type="text" value="" placeholder="eg. Street No/Plot No" id="address_line1" name="address_line1" class="input-text my">
             	  </p>
             	 	<p  class="form-row form-row-first validate-required">
            			<label class="" >Address Line 2 <abbr title="required" class="required">*</abbr>
            			</label>
               	     	<input type="text" value="" placeholder="Location" id="address_line2" name="address_line2" class="input-text my">
             	  </p>
             	  <p  class="form-row form-row-first validate-required">
            			<label class="" >Longitude <abbr title="required" class="required">*</abbr>
            			</label>
               	     	<input type="text" value="" placeholder="Longitude" id="address_longitude" name="address_longitude" class="input-text my">
             	  </p>
             	    <p  class="form-row form-row-first validate-required">
            			<label class="" >Latitude <abbr title="required" class="required">*</abbr>
            			</label>
               	     	<input type="text" value="" placeholder="Longitude" id="address_latitude" name="address_latitude" class="input-text my">
             	  </p>
             	  <p  class="form-row form-row-first validate-required form-group">
            			<label class="" >State <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="address_state" id="address_state" class="selectpicker my">
						<option value="0">Select State</option>
						<%						
							ResultSet rs=DAO.listStates();
							while(rs.next())
							{
							%>
								<option value="<%=rs.getInt("ID")%>"><%=rs.getString("state_name") %></option>
							<%} %>
						</select>
				</p>
				 <p  class="form-row form-row-first validate-required form-group">
            			<label class="" >City <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="address_city" id="address_city" class="selectpicker my">
						<option value="0">Select City</option>
						</select>
				</p>
				<div class="form-row place-order">
                     <input type="submit" data-value="Place order" value="Add Address" id="place_order" name="woocommerce_checkout_place_order" class="btn btn-primary">
                </div>
                <div class="clear"></div>
				</form>
			</div>
			<div class="col-sm-9">				
				<!-- repeate only jumbotron -->
				<%
					rs=DAO.listAddress(Integer.parseInt(request.getParameter("id")));
					if(rs!=null && rs.next())
					{
				%>
				<div class="row jumbotron" style="margin:10px; padding:10px;">
					<div class="col-sm-6" id="map-container" style="height: 300px">
						<!-- <img src='' class="img-responsive img-thumbnail" width="120px"> -->
					</div>
					<div class="col-sm-6">
						<h3 ><%=rs.getString("branch_name") %></h3>
						<h4 ><%=rs.getString("address_line1") %></h4>
						<h4 ><%=rs.getString("address_line2") %></h4>
						<h4 ><%=rs.getString("city_name") %>,&nbsp;<%=rs.getString("state_name") %> </h4>						
					</div>
					<div class="col-sm-3">
						<%-- <h6><a href='<%=rs.getString("branch_website") %>'><%=rs.getString("branch_website") %></a></h6> --%>
						<br>
						<p>							
            				<a href='restaurant_edit.do?rid=<%=rs.getInt("id")%>' style="font-size:20px;"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp
							<a href='restaurant_delete.do?rid=<%=rs.getInt("id")%>' style="font-size:20px;"><span class="glyphicon glyphicon-trash"></span></a>
						</p>
					</div> 
					
				</div>
				<%} %>
			</div> 
		</div>
	</div>
<%@include file="footer.jsp"%>
