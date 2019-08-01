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
if(request.getParameter("email")!=null && request.getParameter("password")!=null)
{
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String imei=request.getParameter("imei");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String password=request.getParameter("password");
ResultSet rs=JSONDAO.register(firstname, lastname, phone, imei, email, password);
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
if(rs!=null )
{
while(rs.next())
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt(1));	
	list.add(m);
}
}
else
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",0);
}
Gson gs=new Gson();
json= gs.toJson(list);
out.write(json);
}
%>