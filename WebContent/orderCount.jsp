<%@page import="bean.SiireBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.SyouhinBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="styles.css">
<title>発注数量入力</title>
</head>
<body>

<% ArrayList<SyouhinBean> syohin = (ArrayList<SyouhinBean>)session.getAttribute("syohin");
ArrayList<SiireBean> siire_list = (ArrayList<SiireBean>)session.getAttribute("siire_list");
%>

<center>
<p class="example2">仕入先を選択し、発注数を入力してください。</p>

<form action="OrderSum" method="Post">

仕入先
<select name="siire_id">
	<option value="未選択">未選択</option>
<%
	for(SiireBean siire : siire_list){
%>
	<option value="<%= siire.getSiire_id() %>"><%= siire.getSiire_name() %></option>
<%
	}
%>
</select>
<br>

<table  class="t-line" id="border">
<tr id="border">
   <th id="border" class="color" width="60">商品ID</th>
   <th id="border" class="color" width="100">商品名</th>
   <th id="border" class="color" width="100">カテゴリ名</th>
   <th id="border" class="color" width="120">仕入基準単価</th>
   <th id="border" class="color" width="100">販売単価</th>
   <th id="border" class="color" width="100">安全在庫数</th>
   <th id="border" class="color" width="40">数量</th>
</tr>
<%
	for(SyouhinBean syohinBean : syohin){
%>
	<tr id="border">
		<td align="center" id="border"><%= syohinBean.getS_id() %></td>
		<td id="border"><%= syohinBean.getS_name() %></td>
		<td id="border"><%= syohinBean.getC_id() %></td>
		<td align="right" id="border"><%= syohinBean.getBaseprice() %></td>
		<td align="right" id="border"><%= syohinBean.getHtanka() %></td>
		<td align="right" id="border"><%= syohinBean.getSafezaiko() %></td>
		<td id="border">
		<input type="text" name="count" size="2"maxlength="3">
		<input id="border" type="hidden" name="s_id" value="<%= syohinBean.getS_id() %>">
		<input id="border" type="hidden" name="s_basePrice" value="<%= syohinBean.getBaseprice() %>">
		</td>
	</tr>
<%
	}
%>
</table>


<p><button class="buttonA" value="発注">発注</button><br></p>
</form>
<form action="Order" method="Post">
<p><button class="buttonA" value="キャンセル">キャンセル</button><br></p>
</form>
</center>

</body>
</html>