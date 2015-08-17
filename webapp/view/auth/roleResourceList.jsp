<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div style="margin: 5px;">

<input type="button" id="addResourceBut" class="submit" value="保存" /> &nbsp; 
<a href="${path}/RoleController/toList.do">返回</a>

<div class="" style="width: 200px; border: 1px solid #95b8e7;">
<ul id="menuTree" data-options="method:'get',animate:true">
</ul>
</div>


</div>
</body>
</html>

<script type="text/javascript">
$(function(){
	$('#menuTree').tree({
		url:'${path}/RoleController/getRoleResourceList.do?roleId=${role.id}',
		checkbox: true,
		onClick: function(node){
			//$('#resourceInfo').load('${path}/ResourceController/toResourceDetailView.do', {id: node.id});
		}
	});
	
	//新增子节点
	$('#addResourceBut').click(function(){
		//var id = ResourceTree.getSelectedItemId();
		var nodes = $('#menuTree').tree('getChecked');
		var data = {};
		var roleId = ${role.id};
		var resIds = [];
		for(var i=0; i<nodes.length; i++){
			var node = nodes[i];
			resIds.push(node.id);
		}
		
		
		$.getJSON('${path}/RoleController/allotResource.do', {roleId:roleId, resIds:resIds.toString()}, function(json){
			if(json.success){
				window.location.href = '${path}/RoleController/toList.do';
			}else{
				alert(json.result);
			}
		});

	});

	
	//删除
	$('#deleteResourceBut').click(function(){
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要删除的节点！'); return ;
		}
		var id = node.id;
		var msg = '确认删除该节点及其子节点吗？';
		if(id == '-1'){
			msg = '确认删除所有资源节点吗？';
		}
		
		
		
		if(confirm(msg)){
			
		}
	});
});


//自适应窗口宽度
$(window).resize(function(){
	$('#dataList').datagrid('resize');
});

//操作
function addOper(val,row){
	var operHtml = '';
	operHtml += '<a class="oper" href="#" onclick="openDetailDialog('+row.id+')">查看</a>&nbsp;';
	operHtml += '<a class="oper" href="#" onclick="openFormDialog('+row.id+')">修改</a>&nbsp;';
	operHtml += '<a class="oper" href="javascript:;" onclick="deleteUser('+row.id+')">删除</a>&nbsp;';
	return operHtml;
}

//搜 索
function searchData(){
	$('#dataList').datagrid('load', {
		userName: $('#userName').val()
	});
}

//打开详情窗口
function openDetailDialog(id){
	var url = '${path}/UserController/toUserDetail.do?id='+id;
	$("#userDetailDialog").dialog({
		title: '用户详情',
		href: url,
		width: 400,
		height: 200,
		closed: false,
		cache: false,
		modal: true
	});
}

//打开表单窗口
function openFormDialog(id){
	var url = '${path}/UserController/toUserForm.do'+(id!=null ? '?id='+id : '');
	$("#userFormDialog").dialog({
		title: '用户维护',
		href: url,
		width: 400,
		height: 200,
		closed: false,
		cache: false,
		modal: true
	});
}

//保存
function saveUser(){
	$('#userForm').form('submit',{
		url: '${path}/UserController/save.do',
		dataType: 'json',
		onSubmit: function(param){
			if(!$(this).form('validate')){
				return false;
			}
			$('#roleList input:checked').each(function(i,dom){
				param['roleList['+i+'].id'] = $(dom).val();
			});
			return true;
		},
		success: function(result){
			if (result == 'success'){
				$.messager.show({
					title:'操作提示',
					msg:'添加成功！',
					showType:'slide',
					style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
					}
				});
				$('#userFormDialog').dialog('close');
				$('#dataList').datagrid('reload');
			}else{
				$.messager.alert('错误提示', result);
			}
		}
	});
}

//删除
function deleteUser(id){
	$.get('${path}/UserController/delete.do',{id:id},function(json){
		if (json.result == 'success'){
			$('#dataList').datagrid('reload');
		}else{
			$.messager.alert('错误提示', json.result);
		}
	});
}
</script>
