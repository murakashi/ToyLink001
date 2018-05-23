<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除画面</title>
</head>
<body>
<%
ArrayList<SyouhinBean> syohinlist = (ArrayList<SyouhinBean>)session.getAttribute("syohinlist");
%>
	<h1>削除しますか？</h1>
	商品ID：<%=syohinlist.get(0).getS_id() %>
	<br>
	商品名：<%=syohinlist.get(0).getS_name() %>
	<br>
	カテゴリ名：<%=syohinlist.get(0).getC_id() %>
	<form action="SyohinDel" method="post">
	<input type="submit" name="bname" value="はい">
	</form>
	<form action="Syohin" method="post">
	<input type="submit" name="bname" value="いいえ">
	</form>
</body>
</html>