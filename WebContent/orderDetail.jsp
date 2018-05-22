<%@page import="java.util.ArrayList"%>
<%@page import="bean.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>発注伝票詳細</title>
</head>
<body>
	<%
		ArrayList<OrderBean> order_list = (ArrayList<OrderBean>) session.getAttribute("order_list");
	%>
	<div id="wrapper">
		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" name="bname" value="メニュー">メニュー</button>
			</form>
		</div>
		<center>
			<h1>発注伝票詳細</h1>
		</center>
		<br>
		<ul>
			<li><h3>
					<label>伝票ID&emsp;：<%=order_list.get(0).getO_id()%></label>
				</h3></li>
			<li><h3>
					<label>仕入先名：<%=order_list.get(0).getSiire_name()%></label>
				</h3></li>
			<li><h3>
					<label>発注日&emsp;：<%=order_list.get(0).getO_date()%></label>
				</h3></li>
		</ul>
		<center>
			<form action="OrderUpdate" method="post">
				<table class="t-line" id="border">
					<tr id="border">
						<th id="border">商品ID</th>
						<th id="border">商品名</th>
						<th id="border">発注数</th>
					</tr>
					<%
						for (OrderBean order : order_list) {
					%>

					<tr id="border">
						<td id="border"><center><%=order.getS_id()%></center></td>
						<td id="border"><%=order.getS_name()%><input type="hidden"
							name="s_id" value="<%=order.getS_id()%>"></td>
						<td id="border"><div align="right"><%=order.getO_count()%></div>
							<input type="hidden" name="count" value="<%=order.getO_count()%>"></td>
					</tr>
					<%
						}
					%>
				</table>
				<br> <br> <input type="hidden" name="o_id"
					value="<%=order_list.get(0).getO_id()%>">
				<button class="buttonA" value="入庫">入庫</button>
			</form>

			<form action="OrderStatus" method="POST">
				<button class="buttonA" value="戻る">戻る</button>
			</form>
		</center>
	</div>
</body>
</html>