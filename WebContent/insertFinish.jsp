<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="styles.css">
<title>新規商品追加完了</title>
</head>
<body>
<center>
<p class="example2">商品情報を1件追加しました。</p>

<h2>続けて発注を行いますか？</h2>
<form action="Order" method="Post">
<p><button class="buttonA">はい</button></p>
</form>

<form action="Menu" method="Post">
<p><button class="buttonA">いいえ</button></p>
</form>

</center>
</body>
</html>