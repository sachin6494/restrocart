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

ResultSet rs=JSONDAO.listStates();
String json="";
List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
while(rs!=null && rs.next())
{
	Map<String,Object> m=new HashMap<String,Object>();
	m.put("id",rs.getInt("id"));
	m.put("state_name",rs.getString("state_name"));	
	list.add(m);
}
Gson gs=new Gson();
json= "{States:"+gs.toJson(list)+"}";
out.write(json);

%>