<%@page import="bean.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="styles.css">
<title>新規商品追加</title>
</head>
<body>

<%
	int s_id = (int)session.getAttribute("s_id");
	ArrayList<CategoryBean> category = (ArrayList<CategoryBean>)session.getAttribute("category");
%>

<center>

<h2>新規商品追加</h2>
<form action="InsertCheck" method="Post">

<p>商品ID：<%= s_id %><input type="hidden" name="s_id" value="<%= s_id %>"></p>

<p class="ki">商品名<input type="text" name="s_name"size="15"></p>
カテゴリ<select name="category">
			<option value="未選択">未選択</option>
			<% for(int i=0;i<category.size();i++){ %>
			<option value="<%= category.get(i).getCategoryid() %>"><%= category.get(i).getC_name() %></option>
			<% } %>
		</select>
<p class="ki">仕入基準単価<input type="number" name="siire_tanka"size="8">円</p>
<p class="ki">販売単価<input type="number" name="h_tanka"size="8">円</p>
<p class="ki">安全在庫数<input type="number" name="safe_zaiko"size="8"></p>

<p><button class="buttonA">新規追加</button></p>
</form>
<form action="Menu" method="Post">
<p><button class="buttonA">戻る</button></p>
</form>
</center>
</body>
</html>