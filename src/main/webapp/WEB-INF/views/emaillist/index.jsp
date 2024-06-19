<%@page import="himedia.vo.EmailVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Servlet으로부터 전달한 list 객체 얻어오기
List<EmailVo> list = null;

if(request.getAttribute("list") instanceof List){	// .getAttirbute는 Object타입으로 주기에 진짜 list가 넘어오는지 확인 필요
	list = (List<EmailVo>)request.getAttribute("list");	//Object이기에 다운 캐스팅 필요
}
%>
	
<!DOCTYPE html>

<html lang="kor">

<head>
	<meta charset="UTF-8">
	<title>메일링 리스트:메인</title>
	<link type="text/css" 
		rel="stylesheet" 
		href="<%= request.getContextPath() %>/css/list.css" />
	<script>
		function delete_item(event, frm) {
			event.preventDefault();
			
			let choice = confirm("메일을 삭제하시겠습니까?");
			if (choice) {
				frm.submit();
			}
		}
	</script>
</head>

<body>
	<h1>메일링 리스트</h1>
	<h3>Model 2 방식</h3>
	<!-- 리스트 -->
	<%
		for(EmailVo vo: list){
	%>
	<!-- vo 객체의 getter를 이용, 리스트를 표시 -->
	<table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<th>성</th>
			<td><%= vo.getLastName() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%= vo.getFirstName() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%= vo.getEmail() %></td>
		</tr>
		<tr class="toolbar">
			<td colspan="2">
			<form method="POST"
				action="<%= request.getContextPath() %>/emaillist/delete.jsp"
				onsubmit="delete_item(event, this)">
				<input type="hidden" 
					name="no" 
					value="">
				<button type="submit">삭제</button>	
			</form>
			</td>
		</tr>
	</table>
	<br />
	<!-- /End -->
	
	<%
		} 
	%>
	<p>
	<!-- ContextPath를 받아와서 form.jsp에 링크 -->
		<a href="<%= request.getContextPath() %>/el?a=form">추가 이메일 등록</a>
	</p>

</body>
</html>