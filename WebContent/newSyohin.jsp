<%@page import="bean.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>新規商品追加</title>
</head>
<body>
<div id="wrapper">
	<%
		int s_id = (int) session.getAttribute("s_id");
		ArrayList<CategoryBean> category = (ArrayList<CategoryBean>) session.getAttribute("category");
	%>

	<center>


			<p>
			<h2>新規商品追加</h2>
			<br>
			</p>
			<form action="InsertCheck" method="Post">
				<table style="table-layout:fixed;" id=bordernone>
					<tr>
						<td class="ki">商品ID</td>
						<td>：</td>
						<td><%=s_id%><input type="hidden" name="s_id"
							value="<%=s_id%>"></td>
					</tr>
					<tr>
						<td>商品名</td>
						<td>：</td>
						<td><input type="text" name="s_name" size="20" required></td>
					</tr>
					<tr>
						<td>カテゴリ</td>
						<td>：</td>
						<td><select name="category" required>
								<option value="">未選択</option>
								<%
									for (int i = 0; i < category.size(); i++) {
								%>
								<option value="<%=category.get(i).getCategoryid()%>"><%=category.get(i).getC_name()%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td>仕入基準単価</td>
						<td>：</td>
						<td><input type="number" name="siire_tanka" size="6" required>円</td>
					</tr>
					<tr>
						<td>販売単価</td>
						<td>：</td>
						<td><input type="number" name="h_tanka" size="6" required>円</td>
					</tr>
					<tr>
						<td>安全在庫数</td>
						<td>：</td>
						<td><input type="number" name="safe_zaiko" size="6" required>個</td>
					</tr>
				</table>

				<p>
					<button class="buttonA">新規追加</button>
				</p>
			</form>
	</center>

	<div class="controls">
		<form action="Menu" method="Post">
			<button class="buttonA" type="submit">戻る</button>
		</form>
	</div>
	</div>
</body>
</html>