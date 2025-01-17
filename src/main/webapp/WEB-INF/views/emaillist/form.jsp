<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>메일링 리스트: 가입 폼</title>
	</head>

	<body>
		<h1>메일링 리스트 가입</h1>
		<h3>Model 2 방식</h3>
		<p>메일링 리스트에 가입하시려면,<br />
			아래 항목을 기입하고 등록 버튼을 클릭하세요.
		</p>

		<form 
			action="<%= request.getContextPath()%>/el" 
			method="POST">
			<input type="hidden" name="a" value="insert"/>
			<label for="ln">성</label>
			<input type="text" name="ln" value=""><br />
			<label for="fn">이름</label>
			<input type="text" name="fn" value=""><br />

			<label for="email">이메일</label>
			<input type="text" name="email" value=""><br />

			<input type="submit" value="등록">
		</form>

		<p>
			<a href="<%= request.getContextPath()%>/el">목록</a>
		</p>
	</body>

	</html>