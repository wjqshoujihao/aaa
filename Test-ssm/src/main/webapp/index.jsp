<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="base.jsp"></jsp:include>
<body>
	<div id="p" class="easyui-panel" title="条件查询"     
			        style="width:100%;height:150px;padding:10px;background:#fafafa;"   
			        data-options="iconCls:'icon-save',closable:true,    
			                collapsible:true,minimizable:true,maximizable:true">   
			    <form id="formstus">   
			  		  角色名称：<input id="name" name="jsname" class="easyui-textbox">&nbsp;&nbsp;&nbsp;&nbsp;
			  		  创建时间：<input id="begindate"  name="date1"  type="text" class="easyui-datetimebox">--<input id="enddate" type="text" name="date1" class="easyui-datetimebox"><br>
			    	<a id="btn1" onclick="cx()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>  
			     	<a id="btn2" onclick="reload()" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</a>
				</form> 
			</div>
	<div id="add_dialogs">
					<a id="btn5" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>  
			     	<a id="btn6" onclick="del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
			     	<a id="btn8" onclick="xg()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
			     	<a id="btn9" onclick="dc()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">导出全部</a>
			     	<a id="btn7" onclick="dr()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">导入</a>
	</div>
	<div id="table_datagrids"></div>
	<div id="dialogs"></div>
	<script type="text/javascript">
	function cx(){
		var name = $("#name").textbox('getValue');
		var begin= $("#begindate").datebox('getValue');
 		var end= $("#enddate").datebox('getValue');
		$("#table_datagrids").datagrid("load",{
   			 "jsname":name,
   			 "date1":begin,
			 "date2":end,
   			 
   	 })
	}
	function dc(){
		var ss=$("#formstus").serialize();
		alert(ss);
 		location.href="<%=request.getContextPath()%>/js/testpoi.action?"+ss;
	}
	function reload(){
		$("#formstus").form("reset");
		cx();
	}
	function xg(){
	  	  //获得所有被选中的行
	  	  var select_options = $("#table_datagrids").datagrid("getSelections");
	  	  if(select_options.length==1){
	  		  //获得当前选择的数据的id
	  		  var productId = select_options[0].jsid;
	  		  $('#dialogs').dialog({    
	    		    title: '修改',    
	    		    width: 700,    
	    		    height: 300,  
	    		    //定义是否可关闭窗口
	    		    closed: false,
	    		    //是否显示关闭按钮
	    		    closable:true,
	    		    cache: false,    
	    		    modal: true,
	    		    href:"<%=request.getContextPath()%>/js/toupdatejs.action?jsid="+productId,
					toolbar:[{
						text:'保存',
						iconCls:'icon-save',
						handler:function(){
							$.ajax({
								url:"<%=request.getContextPath()%>/js/updatejs.action",
								type:"post",
								data:$("#update_form").serialize(),
								dataType:"text",
								success:function(){
									$("#dialogs").dialog("close");
									$('#table_datagrids').datagrid('reload');    // 重新载入当前页面数据  
								},
								error:function(){
									$("#dialogs").dialog("close");
									  $.messager.alert("警告","大表哥修改报错");    
								}
								
							})
						}
					},{
						text:'取消',
						iconCls:'icon-cancel',
						handler:function(){
							$("#add_dialogs").dialog("close");
							
						}
					}]		
	    		}); 
	  		  
	  		  
	  	  }else{
	  		$.messager.confirm('确定','你确定批量修改么',function(r){
	  			if (r) {
	  				var select_options = $("#table_datagrids").datagrid("getSelections");
	  			 	var ids="";
	  			 	if(select_options!=null && select_options!=""){
	  				  for ( var i = 0; i < select_options.length; i++) {
	  					ids+=","+select_options[i].jsid;
	  					}
	  			  	}
	  				ids=ids.substr(1);
		  			var ids =ids.split(",");
		  			for (var i = 0; i < ids.length; i++) {
		  				$('#dialogs').dialog({    
			    		    title: '修改',    
			    		    width: 700,    
			    		    height: 300,  
			    		    //定义是否可关闭窗口
			    		    closed: false,
			    		    //是否显示关闭按钮
			    		    closable:true,
			    		    cache: false,    
			    		    modal: true,
			    		    href:"<%=request.getContextPath()%>/js/toupdatejs.action?jsid="+ids[i],
							toolbar:[{
								text:'保存',
								iconCls:'icon-save',
								handler:function(){
									$.ajax({
										url:"<%=request.getContextPath()%>/js/updatejs.action",
										type:"post",
										data:$("#update_form").serialize(),
										dataType:"text",
										async:false,
										success:function(){
											alert("修改成功即将修改下一条")
											
										},
										
									})
								}
							}]		
			    		});
					}
		  			$('#table_datagrids').datagrid('reload');    // 重新载入当前页面数据 
		  				
				}
	  		}) 
	  	  }
	    }
	 function add(){
	 		$("#dialogs").dialog({
	 			title:"新增角色列表",
	 			width:"500",
				height:"300",
				href: 'addjs.jsp',    
				modal: true,
	 		})
	 	}
	 function del(){
		  var select_options = $("#table_datagrids").datagrid("getSelections");
		  var ids="";
		  if(select_options!=null && select_options!=""){
			  for ( var i = 0; i < select_options.length; i++) {
				ids+=","+select_options[i].jsid;
			}
		  }
		ids=ids.substr(1);
		$.messager.confirm('确定','你确定删除这些数据么',function(r){
			if (r) {
				$.ajax({
					url:"<%=request.getContextPath()%>/js/deletejs.action",
					type:"post",
					data:{"ids":ids},
					dataType:"text",
					success:function(data){
						$("#table_datagrids").datagrid("reload");
					}
				})
			}
		})
	}
	$("#table_datagrids").datagrid({
		title:"角色列表",
    	  url:"<%=request.getContextPath()%>/js/jslist.action",
    	  fitColumns:true,
    	  pagination:true,
    	  pageNumber:1,
    	  pageSize:3,
    	  pageList:[3,5,7,10],
       	  columns:[[   
       	            {field:'jsid',title:'角色编号',width:100},   
       	            {field:'jsname',title:'角色名称',width:100},   
       	            {field:'cjtime',title:'创建时间',width:100},    
       	            {field:'xgtime',title:'修改时间',width:100}, 
       	        	{field:'jsms',title:'资源描述',width:100},    
       	        	{field:'jspx',title:'权限大小（1最大）',width:100}, 
       	        	{field:'',title:'操作',width:100,
       	        	 formatter:function(value,row,index){
       	        		 var cc="";
       	        		 cc+="<input type='button' value='分配权限' onclick=quanxian('"+row.jsid+"')>"
       	        		 return cc;
       	        	 }
       	         }
       	        ]]
       	     
      })
      
      
      </script>
</body>
</html>