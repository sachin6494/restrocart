<%@page import="java.sql.ResultSet"%>
<%@page import="servlets.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<option value="0">Select City</option>
<%
if(request.getParameter("address_state")!=null)
{
int address_state=Integer.parseInt(request.getParameter("address_state"));
ResultSet rs=DAO.listCities(address_state);
while(rs!=null && rs.next())
{
%>
<option value='<%=rs.getInt("id")%>'><%=rs.getString("city_name") %></option>
<%}} %>
