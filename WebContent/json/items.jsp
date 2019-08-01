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
int menu_id=Integer.parseInt(request.getParameter("id"));
ResultSet rs=JSONDAO.listItems(menu_id);
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
while(rs!=null && rs.next())
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt("id"));
	m.put("item_name",rs.getString("item_name"));
	m.put("item_description",rs.getString("item_description"));
	m.put("item_price",rs.getDouble("item_price"));
	m.put("item_delivery_type",rs.getString("item_delivery_type"));
	m.put("menu_name",rs.getString("menu_name"));
	m.put("unit_name",rs.getString("unit_name"));
	list.add(m);
}
Gson gs=new Gson();
json= "{Items:"+gs.toJson(list)+"}";
out.write(json);
}
%>