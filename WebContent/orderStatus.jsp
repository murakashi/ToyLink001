<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>発注状況</title>
</head>
<body>
	<%
		ArrayList<OrderBean> order_list = (ArrayList<OrderBean>) session.getAttribute("order");
	%>
	<div id="wrapper">
		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" name="bname" value="メニュー">メニュー</button>
			</form>
		</div>
		<center>
			<h1>発注状況</h1>
			<table class="t-line" id="border">
				<tr id="border">
					<th id="border" width=60><center>伝票ID</center></th>
					<th id="border" width=110><center>仕入先名</center></th>
					<th id="border" width=100><center>発注日</center></th>
					<th id="border">入庫</th>
					<th id="border">詳細</th>
				</tr>
				<%
					for (OrderBean order : order_list) {
				%>
				<tr id="border" height=40>
					<td id="border"><center><%=order.getO_id()%></center></td>
					<td id="border"><center><%=order.getSiire_name()%></center></td>
					<td id="border"><center><%=order.getO_date()%></center></td>
					<td id="border"><form action="OrderUpdate" method="post">
							<center>
								<button class="buttonA" value="入庫">入庫</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
							</center>
						</form></td>
					<td id="border"><form action="OrderDetail" method="post">
							<center>
								<button class="buttonA" value="詳細">詳細</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
							</center>
						</form></td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
	</div>
</body>
</html>