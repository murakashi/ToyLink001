<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.SelectYearBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>年間売上</title>
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
  color: #191970;
  cursor: pointer;
}
</style>


</head>

<body>
<div id="wrapper">
<br>
<div class = "controls">
<form action = "Menu" method ="POST">
<button class = "buttonA" type = "submit" value = "メニュー">メニュー</button>
</form>
</div>
<center>
<h1>年間売上</h1>
<br>
<br>
<h2 style = "display:inline;" >検索条件</h2>
<form action="UriageYearSearch" method="post">
<ul>
<li><label>年</label>

<select style= width:150px name="year">
<!-- name要確認 -->
<option selected="selected" value="">---</option>
<%
			SelectYearBean years = (SelectYearBean)session.getAttribute("yearslist");

			for(int y=years.getStartyear();y<=years.getEndyear();y++){ %><option value=<%=y %>><%=y %></option>
			<%} %>
		</select></li>
</ul>
<br>
<button class = "buttonA" type = "submit" value = "検索">検索</button>
</form>
<br>
<br>
<span id="prev">前へ</span>
<span id="page"></span>
<span id="next">次へ</span>

<table id = "border" width = "600px">
<tr id = "border">
<th id = "border">年</th>
<th id = "border">売上件数</th>
<th id = "border">売上金額</th>
<th id = "border">利益</th>
</tr>

<% ArrayList<String[]> sel = (ArrayList<String[]>)session.getAttribute("URIAGEY");
for(int i=0;i < sel.size();i++){
	int t =Integer.parseInt(sel.get(i)[2]);
	int n =Integer.parseInt(sel.get(i)[3]); %>

<tr id = "border">
<td id = "border"><center><%= sel.get(i)[0] %></center></td>
<td id = "border"><div align = "right"><%= sel.get(i)[1] %></div></td>
<td id = "border"><div align = "right"><%= sel.get(i)[2] %></div></td>
<td id = "border"><div align = "right"><%= t-n %></div></td>
<%} %>
</tr>

</table>
</center>
<br>
<br>
<div class = "ButtonSet2">
<form action = "Uriage" method = "POST">
<button class = "buttonA" type = "submit">戻る</button>
</form>
</div>
<br>

</div>
</body>
</html>