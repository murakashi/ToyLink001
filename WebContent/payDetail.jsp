<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>支払詳細</title>
<script language="javascript">

function nyukin(){
	var setDate = document.getElementById("pay_date");

	if (!isDate(setDate.value,"/")){
		if (!isDate(setDate.value,"-")){
			alert("日付エラー");
			return false;
		}
	}

	document.frmMain.submit();

}

function isDate (str, delim) {
	  var arr = str.split(delim);
	  if (arr.length !== 3) return false;
	  const date = new Date(arr[0], arr[1] - 1, arr[2]);
	  if (arr[0] !== String(date.getFullYear()) || arr[1] !== ('0' + (date.getMonth() + 1)).slice(-2) || arr[2] !== ('0' + date.getDate()).slice(-2)) {
	    return false;
	  } else {
	    return true;
	  }
	};

</script>
</head>
<body>

	<div id="wrapper">
		<%
			ArrayList<OrderBean> pay_list = (ArrayList<OrderBean>) session.getAttribute("pay_list");
		%>

		<br>
		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>

		<center>
			<h1>発注伝票詳細</h1>
			</center>
			<br>
			<ul>
			<li><h3>
			<label>伝票ID&emsp;</label>
			<%=pay_list.get(0).getO_id()%></h3></li>
			<li><h3>
			<label>仕入先名&emsp;</label>
				<%=pay_list.get(0).getSiire_name()%></h3></li>
			<li><h3>
			<label>発注日&emsp;</label>
				<%=pay_list.get(0).getO_date()%></h3></li>
		</ul>
		<center>
			<form action="PayFinish" method="POST" name="frmMain">

				<table id="border" width="800px">
					<tr id="border">
						<td id="border"><center>商品ID</center></td>
						<td id="border" width = "310px"><center>商品名</center></td>
						<td id="border"><center>発注数</center></td>
						<td id="border"><center>仕入単価</center></td>
						<td id="border"><center>金額</center></td>
					</tr>

					<%
						for (OrderBean order : pay_list) {
					%>
					<tr>
						<td id="border"><center><%=order.getS_id()%></center></td>
						<td id="border"><%=order.getS_name()%><input type="hidden"
							name="s_id" value="<%=order.getS_id()%>"></td>
						<td id="border"><div align = "right"><%=order.getO_count()%></div><input type="hidden"
							name="count" value="<%=order.getO_count()%>"></td>
						<td id="border"><div align = "right"><%=order.getBaseprice()%></div>
						<input type="hidden" name="price" value="<%=order.getBaseprice()%>"></td>
						<td id="border"><div align = "right"><%=order.getKingaku()%></div><input type="hidden"
							name="kingaku" value="<%=order.getKingaku()%>"></td>
					</tr>

					<%
						}
					%>
				</table>
				<br> <h4>支払総金額<%=session.getAttribute("sum")%>円</h4>

				入金日<input type="text" class="text" name="pay_date" id="pay_date">
				<input type="hidden" name="o_id" value="<%=pay_list.get(0).getO_id()%>">
				<br> <br>
				<button class="buttonA" onclick="return nyukin();">支払</button>

			</form>

			<form action="PayStatus" method="POST">
				<button class="buttonA" type="submit">戻る</button>
			</form>
		</center>
	</div>
</body>
</html>