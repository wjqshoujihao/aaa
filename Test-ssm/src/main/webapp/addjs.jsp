<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form id="formadd">
		<table>
			<tr>
				<td>角色名称 </td>
				<td><input name="jsname" class="easyui-textbox"></td>
			</tr>
			<tr>
				<td>权限大小</td>
				<td><input name="jspx" class="easyui-textbox"></td>
			</tr>
			<tr>
				<td>资源描述</td>
				<td><textarea rows="" cols="" name="jsms"></textarea></td>
			</tr>
		</table>
	</form>
	<a id="btn5" onclick="addform()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
	<a id="btn6" onclick="qx()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	
	
	
	<script type="text/javascript">
function addform(){
		 $.ajax({
			 url:"<%=request.getContextPath()%>/js/jsadd.action",
			 type:"post",
			 data:$("#formadd").serialize(),
			 dataType:"text",
			 success:function(){
				$("#dialogs").dialog("close");
				$("#table_datagrids").datagrid("reload"); 
			 }
		 })
}
function qx(){
	 $("#dialogs").dialog("close");
}
</script>
</body>
</html>