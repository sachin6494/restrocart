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
if(request.getParameter("deviceid")!=null)
{
	
String deviceid=request.getParameter("deviceid");
ResultSet rs=JSONDAO.validate(deviceid);
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
if(rs!=null && rs.isBeforeFirst() )
{
	System.out.println("Inn");
while(rs.next())
{
	
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt("id"));
	m.put("firstname",rs.getString("firstname"));
	m.put("lastname",rs.getString("lastname"));
	m.put("email",rs.getString("email"));
	m.put("phone",rs.getString("phone"));	
	list.add(m);
}
}
else
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",0);
}
Gson gs=new Gson();
json= "{User:"+gs.toJson(list)+"}";
out.write(json);
}
%>