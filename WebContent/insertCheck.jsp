<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="styles.css">
<title>Insert title here</title>
</head>
<body>
<center>

<p class="example2">以下の内容の商品を追加します</p>

商品ID：<%= session.getAttribute("s_id") %><br>
商品名：<%= session.getAttribute("s_name") %><br>
カテゴリ：<%= session.getAttribute("category") %><br>
仕入基準単価：<%= session.getAttribute("siire_tanka") %><br>
販売単価：<%= session.getAttribute("h_tanka") %><br>
安全在庫数：<%= session.getAttribute("safe_zaiko") %><br>

<form action="InsertFinish" method="post">
<fieldset><p><button class="buttonA">登録</button></p></fieldset>
</form>

<form action="NewSyohin" method="post">
<fieldset><p><button class="buttonA">キャンセル</button></p></fieldset>
</form>
</center>
</body>
</html>