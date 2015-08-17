<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div style="margin: 5px;">

<div class="" style="float: left;width: 200px; border: 1px solid #95b8e7;">
<ul id="menuTree" data-options="method:'get',animate:true">
	<li>
		<span>aaaa</span>
	</li>
</ul>
</div>

<div style="float: left; min-width: 500px;">
<div class="box-positon">
	<form class="ropt">
		<input type="button" id="addMenuBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="updateMenuBut" class="reset" value="修改" /> &nbsp; 
		<input type="button" id="deleteMenuBut" class="del-button" value="删除" /> &nbsp; 
	</form>
	<div class="clear"></div>
</div>

<div id="menuInfo" style="">
</div>
</div>

</div>
</body>
</html>

<script type="text/javascript">
$(function(){
	$('#menuTree').tree({
		url:'${path}/MenuController/getMenuList.do',
		onClick: function(node){
			$('#menuInfo').load('${path}/MenuController/toMenuDetailView.do', {id: node.id});
		}
	});
	
	//新增子节点
	$('#addMenuBut').click(function(){
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要修改的节点！'); return ;
		}
		var id = node.id;
		var data = {};
		if(id != '0'){
			data.parentId = id;
		}

		//获取节点的层级数
		//data.menuLevel = menuTree.getLevel(id);
		
		$('#menuInfo').load('${path}/MenuController/toMenuFormView.do', data);
	});

	//修改
	$('#updateMenuBut').click(function(){
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要修改的节点！'); return ;
		}else if(node.id == '0'){
			alert('该节点不能修改！'); return ;
		}
		$('#menuInfo').load('${path}/MenuController/toMenuFormView.do', {id: node.id});
	});
	
	//删除
	$('#deleteMenuBut').click(function(){
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
			$.getJSON('${path}/MenuController/removeAll.do', {id: (id=='-1'?'':id)}, function(json){
				if(json.success){
					if(id != '-1'){
						//var parentId = $('#menuTree').tree('getParent', node.target).id;
						var node = $('#menuTree').tree('getSelected');
						var pnode = $('#menuTree').tree('getParent', node.target);
						//选中父节点
						$('#menuTree').tree('select', pnode.target);
						//刷新树节点
						$('#menuTree').tree('reload', pnode.target);
						//刷新表单域
						$('#menuInfo').load('${path}/MenuController/toMenuDetailView.do', {id: pnode.id});
					}else{
						//刷新树节点
						//menuTree.refreshItem('-1');
						var node = $('#menuTree').tree('find', 0);
						$('#menuTree').tree('reload', node.target);
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
