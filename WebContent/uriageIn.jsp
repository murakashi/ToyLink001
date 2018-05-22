<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="styles.css">
<title>売上入力</title>
</head>
<body>
<div id = "header">ヘッダー</div>
<div id="wrapper">

<br>
<div class = "controls">
	<form action = "Menu" method = "POST">
	<button class = "buttonA" type = "submit" value = "メニュー">メニュー</button>
	</form>
</div>
<form action = "UriageFin" method = "POST">

<center>
<h1>売上入力</h1>
<br>
<br>
<table id = "bordernone">
<tr>
<td>
商品ID</td>
<td>
&emsp;<input type = "text" class = "text" name = "syouID">
</td>
</tr>
<tr>
<td>
<p/>
売上日</td>
<td>
&emsp;<input type = "text" class = "text" name = "day"></td>
</tr>
<tr>
<td>
売上数</td>
<td>
&emsp;<input type = "text" class = "text" name = "salNum">
</td>
<tr>
<td>
<p/>
販売単価</td>
<td>
&emsp;<input type = "text" class = "text" name = "tanka">
</td>
<tr>
<td>
破損</td>
<td>
 <div class = "chkbox">
&emsp;<input type = "checkbox" id="checkbox01" name = "break" value = "hason"> <label for="checkbox01"></label></div></td>
</tr>
</table>
</center>

<div class = "ButtonSet2">
<button class = "buttonA" type = "submit">完了</button>
</div>
</form>

</div>
<div id = "footer">フッター</div>
</body>
</html>