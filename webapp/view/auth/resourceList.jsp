<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div style="margin: 5px;">

<div style="width: 200px;">
<ul id="menuTree" data-options="url:'${path}/ResourceController/getResourceTree.do',method:'get',animate:true"></ul>
</div>


<div class="box-positon">
	<form class="ropt">
		<input type="button" id="addResourceBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="updateResourceBut" class="reset" value="修改" /> &nbsp; 
		<input type="button" id="deleteResourceBut" class="del-button" value="删除" /> &nbsp; 
	</form>
	<div class="clear"></div>
</div>

<div id="resourceInfo" style="float: left; width:79%;">
</div>


</div>
</body>
</html>

<script type="text/javascript">
$(function(){
	$('#menuTree').tree({
		onClick: function(node){
			$('#resourceInfo').load('${path}/ResourceController/toResourceDetailView.do', {id: node.id});
		}
	});
	
	//新增子节点
	$('#addResourceBut').click(function(){
		//var id = ResourceTree.getSelectedItemId();
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要修改的节点！'); return ;
		}
		var id = node.id;
		var data = {};
		if(id > 0){
			data.parentId = id;
		}

		//获取节点的层级数
		//data.resourceLevel = ResourceTree.getLevel(id);
		
		$('#resourceInfo').load('${path}/ResourceController/toResourceFormView.do', data);
	});

	//修改
	$('#updateResourceBut').click(function(){
		var id = ResourceTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}else if(id == '-1'){
			alert('该节点不能修改！'); return ;
		}
		$('#resourceInfo').load($('#initPath').val()+'/ResourceController.do?method=toResourceFormView', {objId:id});
	});
	
	//删除
	$('#deleteResourceBut').click(function(){
		var id = ResourceTree.getSelectedItemId();
		var msg = '确认删除该节点及其子节点吗？';
		if(id == '-1'){
			msg = '确认删除所有资源节点吗？';
		}
		if(confirm(msg)){
			$.getJSON($('#initPath').val()+'/ResourceController.do?method=removeAll', {objId: (id=='-1'?'':id)}, function(json){
				if(json.success){
					if(id != '-1'){
						var parentId = ResourceTree.getParentId(id);
						//选中父节点
						ResourceTree.selectItem(parentId);
						//刷新树节点
						ResourceTree.refreshItem(parentId);
						//刷新表单域
						$('#resourceInfo').load($('#initPath').val()+'/ResourceController.do?method=toResourceDetailView', {objId: parentId});
					}else{
						//刷新树节点
						ResourceTree.refreshItem('-1');
					}
				}
			});
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