<%@ page import="bean.SyouhinBean"%>
<%@ page import="bean.CategoryBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<title>在庫一覧</title>
<script>
	$(function() {
		var page = 0;
		function draw() {
			$('#page').html(page + 1);
			$('tr').hide();
			$('tr:first,tr:gt(' + page * 10 + '):lt(10)').show();
		}
		$('#prev').click(function() {
			if (page > 0) {
				page--;
				draw();
			}
		});
		$('#next').click(function() {
			if (page < ($('tr').size() - 1) / 10 - 1) {
				page++;
				draw();
			}
		});
		draw();
	});
</script>
<style>
#prev, #next {
	color: red;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" name="bname" value="メニュー">メニュー</button>
			</form>
		</div>
		<center>
			<h1>在庫</h1>
		</center>
		<br>
		<%
			ArrayList<SyouhinBean> syouhinlist = (ArrayList<SyouhinBean>) session.getAttribute("syouhinlist");
			String orderid = (String) session.getAttribute("orderid");
			ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>) session.getAttribute("categorylist");
		%>
		<center>検索条件</center>
		<form action="ZaikoSearch" method="post">
			<ul>
				<li><label>商品名&emsp;：</label> <input type="text" class="text"
					name="syouhin"> <br></li>
				<li><label>カテゴリ：</label> <select name="category">
						<option selected="selected" value=""></option>
						<%
							for (int i = 0; i < categorylist.size(); i++) {
						%>
						<option value="<%=categorylist.get(i).getCategoryid()%>">
							<%=categorylist.get(i).getC_name()%></option>
						<%
							}
						%>
				</select></li>
			</ul>
			<center>
				<input type="checkbox" name="dflg" value="denger">危険域商品
			</center>

			<p />
			<center>
				<button class="buttonA" name="bname" value="検索">検索</button>
			</center>
		</form>
	</div>

	<p />
	<center>
		<span id="prev">前へ</span> <span id="page"></span> <span id="next">次へ</span>
	</center>

	<center>
		<table class="t-line" id="border">
			<tr id="border">
				<th id="border" width="60">商品ID</th>
				<th id="border" width="310">商品名</th>
				<th id="border" width="80">安全在庫数</th>
				<th id="border" width="80">在庫数</th>
				<th id="border" width="30"></th>
			</tr>
			<%
				int id = 0;
				for (int i = 0; i < syouhinlist.size(); i++) {
			%>
			<tr id="border">
				<td id="border"><div align="center"><%=syouhinlist.get(i).getS_id()%></div></td>
				<td id="border"><%=syouhinlist.get(i).getS_name()%></td>
				<td id="border"><div align="right"><%=syouhinlist.get(i).getSafezaiko()%></div></td>
				<td id="border"><div align="right"><%=syouhinlist.get(i).getZaiko()%></div></td>
				<td id="border"><form action="ZaikoSearch" method="post">
						<button class="buttonA" name="order"
							value="<%=syouhinlist.get(i).getS_id()%>">発注</button>
					</form></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>