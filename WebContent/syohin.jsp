<%@page import="bean.CategoryBean"%>
<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<title>商品一覧</title>
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
			<h1>商品一覧</h1>
		</center>
		<%
				ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>) session.getAttribute("categorylist");
				ArrayList<SyouhinBean> syouhinlist = (ArrayList<SyouhinBean>) session.getAttribute("syouhinlist");
				String orderid = (String) session.getAttribute("orderid");

				 String name = (String)session.getAttribute("s_name");
				 String c_id = (String)session.getAttribute("c_id");
			%>
			<p><%=session.getAttribute("message")%></p>
			<center><h3>検索条件</h3></center>
			<form action="Syohin" method="post">
			<ul>
				<li><label>商品名&emsp;：</label>
				 <%
 	   if(name == null || name.equals("")){
 %>
 	   		<input type="text" class="text" name="s_name">
 <%
 	   }else{
 %>
    			<input type="text" class="text" name="s_name" value="<%= name %>">
 <%
 	   }
 %>
 </li>
 カテゴリ：
 <select name="category">
 <%
 	if(c_id == null || c_id.equals("未選択")){
 %>
 			<option value="未選択" selected="selected">未選択</option>
 <%
             for(CategoryBean c : categorylist){

 %>
 			<option value="<%= c.getCategoryid() %>"><%= c.getC_name() %></option>
 <%
             }
 	}else{
 %>
 			<option value="未選択">未選択</option>
 <%
 	        for(CategoryBean c : categorylist){
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
 	}
 %>
 		</select>
				</li>
			</ul>
			<center>
				<button class="buttonA" name="bname" value="検索">検索</button>
			</center>
			<center>
			<span id="prev">前へ</span> <span id="page"></span> <span id="next">次へ</span>
			</center>
			<center>
			<table id="border" class="t-line">
				<tr id="border">
					<th id="border" width="40">商品ID</th>
					<th id="border" width="150">商品名</th>
					<th id="border" width="80">カテゴリ名</th>
					<th id="border" width="80">仕入基準単価</th>
					<th id="border" width="80">販売単価</th>
					<th id="border" width="80">安全在庫数</th>
					<th id="border" width="30">変更</th>
					<th id="border" width="30">削除</th>
				</tr>

				<%
						int id = 0;
						for (int i = 0; i < syouhinlist.size(); i++) {
					%>
				<tr>
					<td id="border"><center><%=syouhinlist.get(i).getS_id()%></center></td>
					<td id="border"><%=syouhinlist.get(i).getS_name()%></td>
					<td id="border"><%=syouhinlist.get(i).getC_id()%></td>
					<td id="border"><div align="right"><%=syouhinlist.get(i).getBaseprice()%></div></td>
					<td id="border"><div align="right"><%=syouhinlist.get(i).getHtanka()%></div></td>
					<td id="border"><div align="right"><%=syouhinlist.get(i).getSafezaiko()%></div></td>
					<td id="border"><form action="Syohin" method="post">
							<button class="buttonA" name="updatebtn"
								value="<%=syouhinlist.get(i).getS_id()%>">変更</button>
						</form></td>
					<td id="border"><form action="SyohinDel" method="post">
							<button class="buttonA" name="deletebtn"
								value="<%=syouhinlist.get(i).getS_id()%>">削除</button>
						</form></td>
				</tr>
				<%
						}
					%>
			</table>
			</center>
		</form>
	</div>

</body>
</html>