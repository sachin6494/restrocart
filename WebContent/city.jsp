<%@page import="servlets.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>



<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<form action="StoreCity.do" method="post">
				<p  class="form-row form-row-first validate-required">
            			<label class="" >State <abbr title="required" class="required">*</abbr>
            			</label>
						<select name="state" id="state" class="selectpicker my">
						<%
						if(request.getMethod().equalsIgnoreCase("get"))
						{
						ResultSet rs=DAO.listStates(Integer.parseInt(request.getParameter("id")));
						while(rs.next())
						{
						%>
						<option value="<%=rs.getInt("ID")%>"><%=rs.getString("state_name") %></option>
						<%}} %>
						</select>
						</p>
					<p  class="form-row form-row-first validate-required">
            			<label class="" >City Name <abbr title="required" class="required">*</abbr>
            			</label>
               	     <input type="text" value="" placeholder="eg. Noida" id="city_name" name="city_name" class="input-text my">
             	  </p>             	
				<div class="form-row place-order">
                     <input type="submit" data-value="Place order" value="Add City" id="place_order" name="woocommerce_checkout_place_order" class="btn btn-primary">
                </div>
                <div class="clear"></div>
				</form>
			</div>
			<div class="col-sm-9">				
				<!-- repeate only jumbotron -->
				<%
					ResultSet rs=DAO.listCities();
					while(rs!=null && rs.next())
					{
				%>
				<div class="row jumbotron" style="margin:10px;height:1%;padding: 0px;">
					<%-- <div class="col-sm-3">
						<img src='Logo.do?source=restaurants&rid=<%=rs.getInt("id")%>' class="img-responsive img-thumbnail" width="120px">
					</div> --%>
					<div class="col-sm-6">
						<h4 ><%=rs.getString("city_name") %></h4>
						 <h5><%=rs.getString("state_name") %></h5> 
						<%-- <p style="font-size:12px;"><%=rs.getString("res_desc") %><a href="#">Read more...</a></p>	 --%>	
					</div>
					<div class="col-sm-6" >
						<%-- <h6><a href='<%=rs.getString("res_website") %>'><%=rs.getString("res_website") %></a></h6> --%>
						<br>
						<p style="float: right;">
							<%-- <a href='branches.jsp?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-cog"></span></a>&nbsp; --%>
							<a href='city_edit.do?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;
							<a href='city_delete.do?id=<%=rs.getInt("id")%>'><span class="glyphicon glyphicon-trash"></span></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>