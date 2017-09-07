<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form id="update_form">
			<input name="jsid" type="hidden" value="${uu.jsid}">
		<table>
			<tr>
				<td>角色名称 </td>
				<td><input name="jsname" class="easyui-textbox" value="${uu.jsname}"></td>
			</tr>
			<tr>
				<td>权限大小</td>
				<td><input name="jspx" class="easyui-textbox" value="${uu.jspx}"></td>
			</tr>
			<tr>
				<td>资源描述</td>
				<td><textarea rows="" cols="" name="jsms">${uu.jsms}</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>