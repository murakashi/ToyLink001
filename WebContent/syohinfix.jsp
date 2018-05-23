<%@page import="bean.CategoryBean"%>
<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品情報の変更</title>
</head>
<body>
<%
	ArrayList<SyouhinBean> syohinlist = (ArrayList<SyouhinBean>)session.getAttribute("syohindata");
	ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>)session.getAttribute("categorylist");
	String c_id = (String)session.getAttribute("c_id");
%>
	変更画面<form action="Menu"><input type="submit" name="bname" value="メニュー"></form>
	<br>
	<form action="SyohinFix" method="post">
	商品名:<input type="text" name="s_name" value="<%= syohinlist.get(0).getS_name() %>" required>
	<br>
	カテゴリ名:
	<select name="category">
	<% for(CategoryBean c : categorylist){
	        	if(c.getCategoryid().equals(c_id)){
				%>
	        		<option value="<%= c.getCategoryid() %>" selected="selected"><%= c.getC_name() %></option>
<%
	        	}else{
%>
					<option value="<%= c.getCategoryid() %>"><%= c.getC_name() %></option>
<%
	        	}
	        }
	%>
	</select>
	<br>
	仕入基準単価：<input type="number" name="baseprice" value="<%= syohinlist.get(0).getBaseprice() %>" min="1" required>
	<br>
	販売単価<input type="number" name="htanka" value="<%= syohinlist.get(0).getHtanka() %>" min="1" required>
	<br>
	安全在庫数<input type="number" name="safezaiko" value="<%= syohinlist.get(0).getSafezaiko() %>" min="1" required>
	<br>
	<input type="submit" name="bname" value="変更">
	<input type="submit" name="bname" value="戻る">
	</form>
</body>
</html>