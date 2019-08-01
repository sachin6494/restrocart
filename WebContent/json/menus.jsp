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
int branch_id=Integer.parseInt(request.getParameter("id"));
ResultSet rs=JSONDAO.listMenus(branch_id);
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
while(rs!=null && rs.next())
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt("id"));
	m.put("menu_name",rs.getString("menu_name"));	
	list.add(m);
}
System.out.print("Menu Page");

Gson gs=new Gson();
json= "{Menu:"+gs.toJson(list)+"}";
out.write(json);
}
%>