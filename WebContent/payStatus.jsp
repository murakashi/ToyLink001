<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>支払状況</title>
<script language="javascript">

function nyukin(oid){
	var form = document.getElementById("Nyukin");
	var dt   = document.getElementById("hid_date");
	var nyukin = document.getElementById("o_id_nyukin");
	var setDate = document.getElementById("pay_date" + oid);
	nyukin.value=oid

	if (!isDate(setDate.value,"/")){
		if (!isDate(setDate.value,"-")){
			alert("入金日を入力してください");
			return false;
		}
	}
	dt.value = setDate.value;
	form.submit();

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
		<br>

		<%
			ArrayList<OrderBean> order_payList = (ArrayList<OrderBean>) session.getAttribute("order_payList");
		%>

		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>
		<center>
			<h1>支払状況</h1>
			<br> <br>
			<table id="border" width = "800px">
				<tr>
					<th id="border"><center>伝票ID</center></th>
					<th id="border"><center>支払先名</center></th>
					<th id="border"><center>支払金額</center></th>
					<th id="border"><center>入金日</center></th>
					<th id="border"><center>支払</center></th>
					<th id="border"><center>詳細</center></th>
				</tr>
				<%
					for (OrderBean order : order_payList) {
				%>
				<tr height=40>
					<td id="border"><center><%=order.getO_id()%></center></td>
					<td id="border"><center><%=order.getSiire_name()%></center></td>
					<td id="border"><div align="right"><%=order.getKingaku()%></div></td>
					<td id="border">
						<center>
							<input type="date" class="text" width="400px" name="pay_date_tmp"
								id="pay_date<%=order.getO_id()%>" required>
						</center>
					</td>

					<td id="border">
						<!-- <form action="PayFinish" method="post"> -->

							<center>
								<button class="buttonA" type="submit"
									onclick ="nyukin(<%=order.getO_id()%>);">支払</button>
							</center>

					</td>
					<td id="border">
						<form action="PayDetail" method="post">

							<center>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
								<button class="buttonA" type="submit">詳細</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>>">
							</center>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
		<br>

		<form id="Nyukin" method="POST" action="PayFinish">
			<input type="hidden" name="pay_date" id="hid_date"> <input
				type="hidden" name="o_id" id="o_id_nyukin">
		</form>

		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">戻る</button>
			</form>
		</div>
	</div>

</body>
</html>