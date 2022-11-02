<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconnect.jsp" %>
<%@ include file="./charset.jsp"%>

  <%
      String SQL = "select * from create_coupon order by cidx desc limit 5";
	  ArrayList<Map<String,Object>> AL = null;
      try{
         PreparedStatement PS = CON.prepareStatement(SQL);
         ResultSet RS = PS.executeQuery();
       	 AL = new ArrayList<>();
      
         while(RS.next()){   
        	Map<String,Object> MP = new HashMap<>();
        	
        	MP.put("cidx", RS.getString("cidx"));
        	MP.put("cname",RS.getString("cname"));
        	MP.put("cpart",RS.getString("cpart"));
        	MP.put("coupondatestart",RS.getString("coupondatestart").substring(0,10));
        	MP.put("coupondateend", RS.getString("coupondateend").substring(0,10));
        	MP.put("ctype", RS.getString("ctype"));
        	MP.put("cdiscount", RS.getString("cdiscount"));
        	MP.put("cmimcost", RS.getString("cmimcost"));
        	MP.put("cimage", RS.getString("cimage"));
        	MP.put("cinsertdate", RS.getString("cinsertdate").substring(0,10));
        	AL.add(MP);
         }
         
      }catch(Exception e){
         out.print("DB CONNECT FAIL.");
      }finally{   
         if(CON != null){
            CON.close();
         }
      }
%>