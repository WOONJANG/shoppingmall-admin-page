<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="./charset.jsp"%>
<%@ include file="./dbconnect.jsp"%>

<%
try{
 	String folder = application.getRealPath("/product");
 	String folder1[] = folder.split("/jangwoon0518/tomcat/webapps/portfolio2/");
 	int size = 1024*1024*2;
 	String type="UTF-8";
 	MultipartRequest multi = new MultipartRequest(request,folder,size,type,new DefaultFileRenamePolicy());
 	String d_code = multi.getParameter("d_code");
 	String s_code = multi.getParameter("s_code");
 	String p_code = multi.getParameter("p_code");
 	String p_name = multi.getParameter("p_name");
 	String p_text = multi.getParameter("p_text");
 	String p_money = multi.getParameter("p_money");
 	String p_sale = multi.getParameter("p_sale");
 	String p_salemoney = multi.getParameter("p_salemoney");
 	String p_ea = multi.getParameter("p_ea");
 	String p_use = multi.getParameter("p_use");
 	String filenm1 = "";
 	String filenm2 = "";
 	String filenm3 = "";
 	String p_soldout = multi.getParameter("p_soldout");
 	
	String p_img1 = multi.getFilesystemName("p_img1");
	if(p_img1 == null){
		filenm1 = null;
	}else{
	 	filenm1 = folder1[1] + "/" + p_img1;
	}
	
	String p_img2 = multi.getFilesystemName("p_img2");
	if(p_img2 == null){
		filenm2 = null;
	}else{
		filenm2 = folder1[1] + "/" + p_img2;
	}
	
	String p_img3 = multi.getFilesystemName("p_img3");
	if(p_img3 == null){
		filenm3 = null;
	}else{
		filenm3 = folder1[1] + "/" + p_img3;
	}
	out.print(filenm1);
	out.print(filenm2);
	out.print(filenm3);
	
	String path = request.getServletContext().getRealPath("");
// 	out.print(path);
//C:\portfolio2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\portfolio2\product
	
	String p_info = multi.getParameter("p_info");
	String p_indate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	
// 	String filenm2 = null;
// 	String filenm3 = null;
	
	ArrayList<String> create_product = new ArrayList<String>();	
	
	create_product.add(d_code);
	create_product.add(s_code);
	create_product.add(p_code);
	create_product.add(p_name);
	create_product.add(p_text);
	create_product.add(p_money);
	create_product.add(p_sale);
	create_product.add(p_salemoney);
	create_product.add(p_ea);
	create_product.add(p_use);
	create_product.add(p_soldout);
	create_product.add(filenm1);
	create_product.add(filenm2);
	create_product.add(filenm3);
	create_product.add(p_info);
	create_product.add(p_indate);
	
	//out.print(create_product);
	// web 경로
	String upload = request.getRealPath("upload");
	String SQL = "insert into create_product values('0',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement PS = CON.prepareStatement(SQL);

		PS.setObject(1, create_product.get(0));
		PS.setObject(2, create_product.get(1));
		PS.setObject(3, create_product.get(2));
		PS.setObject(4, create_product.get(3));
		PS.setObject(5, create_product.get(4));
		PS.setObject(6, create_product.get(5));
		PS.setObject(7, create_product.get(6));
		PS.setObject(8, create_product.get(7));
		PS.setObject(9, create_product.get(8));
		PS.setObject(10, create_product.get(9));
		PS.setObject(11, create_product.get(10));
		PS.setObject(12, create_product.get(11));
		PS.setObject(13, create_product.get(12));
		PS.setObject(14, create_product.get(13));
		PS.setObject(15, create_product.get(14));
		PS.setObject(16, create_product.get(15));
		
		
		int n = 0;
		n = PS.executeUpdate();
		
	if(n > 0) {
		out.print("<script>alert('상품 저장 완료');history.go(-1);</script>");
	}
	else {
		throw new Exception("ERROR");
	}
	
	}catch(Exception e){
		out.print("<script>alert('TABLE ERROR');</script>");/* history.go(-1); */
		out.print(e);
		
	}finally{	
		if(CON != null){
			CON.close();
		}
	}
%>