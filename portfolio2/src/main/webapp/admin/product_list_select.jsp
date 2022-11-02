<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconnect.jsp" %>
<%@ include file="./charset.jsp"%>

  <%
      String SQL = "select * from create_product order by pidx desc";
	  ArrayList<Map<String,Object>> AL = null;
      try{
         PreparedStatement PS = CON.prepareStatement(SQL);
         ResultSet RS = PS.executeQuery();
       	 AL = new ArrayList<>();
      
         while(RS.next()){   
        	Map<String,Object> MP = new HashMap<>();
        	
        	MP.put("p_code", RS.getString("p_code"));
        	MP.put("p_img1",RS.getString("p_img1"));
        	MP.put("p_name",RS.getString("p_name"));
        	MP.put("d_code",RS.getString("d_code"));
        	MP.put("p_money", RS.getString("p_money"));
        	MP.put("p_salemoney", RS.getString("p_salemoney"));
        	MP.put("p_sale", RS.getString("p_sale"));
        	MP.put("p_ea", RS.getString("p_ea"));
        	MP.put("p_use", RS.getString("p_use"));
        	MP.put("p_sold", RS.getString("p_sold"));
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