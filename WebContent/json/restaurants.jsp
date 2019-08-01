<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="servlets.JSONDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if(request.getParameter("id")!=null)
{
int cityid=Integer.parseInt(request.getParameter("id"));
ResultSet rs=JSONDAO.listBranchByCity(cityid);
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
while(rs!=null && rs.next())
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt("id"));
	m.put("branch_name",rs.getString("branch_name"));
	m.put("branch_email",rs.getString("branch_email"));
	m.put("branch_phone",rs.getString("branch_phone"));
	m.put("address_line1",rs.getString("address_line1"));
	m.put("address_line2",rs.getString("address_line2"));
	m.put("logo","http://10.0.2.2:8010/RestroKart/Logo.do?source=branch&rid="+rs.getInt("id"));
	list.add(m);
}
Gson gs=new Gson();
json= "{Restaurants:"+gs.toJson(list)+"}";
out.write(json);
}
%>

