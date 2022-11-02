<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp" %>
<%

String SQL = "select mall_title, mall_email, mall_pointuse, mall_basicpoint, mall_joinlevel, mall_name, mall_number, mall_headname, mall_headtel, mall_businessnumber, mall_telebusinessnumber, mall_zipcode, mall_addr, mall_infomanagername, mall_infomanagermail, mall_withoutbank, mall_banknumber, mall_creditcarduse, mall_telpaymentuse, mall_bookcouponuse, mall_minpoint, mall_maxpoint, mall_cashreceiptsuse, mall_shippingcompany, mall_shippingcost, mall_hopeshippingdate from admin_mall_setting order by mall_idx desc";

PreparedStatement ps = null;
ResultSet rs = null;
ArrayList<Map<String,Object>> al = null;

try{
	ps = CON.prepareStatement(SQL);
	rs = ps.executeQuery();
	al = new ArrayList<>();
	
	while(rs.next()){
		Map<String,Object> mp = new HashMap<>();
		mp.put("mall_title",rs.getString("mall_title"));
		mp.put("mall_email",rs.getString("mall_email"));
		mp.put("mall_pointuse",rs.getString("mall_pointuse").intern());
		mp.put("mall_basicpoint",rs.getString("mall_basicpoint"));
		mp.put("mall_joinlevel",rs.getString("mall_joinlevel"));
		mp.put("mall_name",rs.getString("mall_name"));
		mp.put("mall_number",rs.getString("mall_number"));
		mp.put("mall_headname",rs.getString("mall_headname"));
		mp.put("mall_headtel",rs.getString("mall_headtel"));
		mp.put("mall_businessnumber",rs.getString("mall_businessnumber"));
		mp.put("mall_telebusinessnumber",rs.getString("mall_telebusinessnumber"));
		mp.put("mall_zipcode",rs.getString("mall_zipcode"));
		mp.put("mall_addr",rs.getString("mall_addr"));
		mp.put("mall_infomanagername",rs.getString("mall_infomanagername"));
		mp.put("mall_infomanagermail",rs.getString("mall_infomanagermail"));
		mp.put("mall_withoutbank",rs.getString("mall_withoutbank"));
		mp.put("mall_banknumber",rs.getString("mall_banknumber"));
		mp.put("mall_creditcarduse",rs.getString("mall_creditcarduse").intern());
		mp.put("mall_telpaymentuse",rs.getString("mall_telpaymentuse").intern());
		mp.put("mall_bookcouponuse",rs.getString("mall_bookcouponuse").intern());
		mp.put("mall_minpoint",rs.getString("mall_minpoint"));
		mp.put("mall_maxpoint",rs.getString("mall_maxpoint"));
		mp.put("mall_cashreceiptsuse",rs.getString("mall_cashreceiptsuse").intern());
		mp.put("mall_shippingcompany",rs.getString("mall_shippingcompany"));
		mp.put("mall_shippingcost",rs.getString("mall_shippingcost"));
		mp.put("mall_hopeshippingdate",rs.getString("mall_hopeshippingdate").intern());
		
		al.add(mp);
	}
}catch(Exception e){
	e.getMessage();
}


%>
