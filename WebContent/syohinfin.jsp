<%@page import="bean.SyouhinBean"%>
<%@page import="bean.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>変更確認画面</title>
</head>
<body>
	<h1>以下の内容に変更してよろしいですか？</h1>
	<%
		SyouhinBean syohin = (SyouhinBean)session.getAttribute("updatesyohin");
		ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>)session.getAttribute("categorylist");

		ArrayList<SyouhinBean> before = (ArrayList<SyouhinBean>)session.getAttribute("syohinlist");
	%>
	<p>変更前↓</p>
	<p>商品名:<%= before.get(0).getS_name() %></p>
	<p>カテゴリ名<%= before.get(0).getC_id()  %></p>
	<p>仕入基準価格<%= before.get(0).getBaseprice() %></p>
	<p>販売価格<%= before.get(0).getHtanka() %></p>
	<p>安全在庫数<%= before.get(0).getSafezaiko() %></p>

	<p>変更後↓</p>
	<p>商品名:<%= syohin.getS_name() %></p>
	<p>カテゴリ名<%= categorylist.get(0).getC_name() %></p>
	<p>仕入基準価格<%= syohin.getBaseprice() %></p>
	<p>販売価格<%= syohin.getHtanka() %></p>
	<p>安全在庫数<%= syohin.getSafezaiko() %></p>
	<form action="SyohinFix" method="post">
		<input type="submit" name="bname" value="はい">
		<input type="submit" name="bname" value="いいえ">
	</form>

</body>
</html>