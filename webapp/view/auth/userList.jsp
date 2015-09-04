<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div class="mbody">
<table id="dataList" class="easyui-datagrid" title="用户列表"
	url='${path}/UserController/getPage.do'
	data-options="rownumbers:true,singleSelect:true,pagination:true,pageSize:10,method:'post',toolbar:'#tb',fitColumns:true">
	<thead>
		<tr>
			<th data-options="field:'id',width:80">ID</th>
			<th data-options="field:'userName',width:80">用户名</th>
			<th data-options="field:'realName',width:80">姓名</th>
			<th data-options="field:'status',width:80">状态</th>
			<th data-options="field:'createTime',width:80">创建时间</th>
			<th data-options="field:'oper', formatter:addOper">操作</th>
		</tr>
	</thead>
</table>

<div id="tb" style="height:auto">
	<table style="width:100%;">
		<tr>
			<td>
				用户名: <input id="userName" name="userName" />
				<a href="javascript:;" onclick="searchData();" class="easyui-linkbutton" iconCls="icon-search">搜 索</a>
			</td>
			<td align="right">
				<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="false" onclick="openFormDialog();">新增用户</a>
			</td>
		</tr>
	</table>
</div>

<!-- 详情弹出窗口 -->
<div id="userDetailDialog" class="easyui-dialog" closed="true" buttons="#userDetailDialog-buttons"></div>
<div id="userDetailDialog-buttons">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#userDetailDialog').dialog('close')">关闭</a>
</div>

<!-- 表单弹出窗口 -->
<div id="userFormDialog" class="easyui-dialog" closed="true" buttons="#userFormDialog-buttons"></div>
<div id="userFormDialog-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#userFormDialog').dialog('close')">取消</a>
</div>
</div>

</body>
</html>

<script type="text/javascript">
//自适应窗口宽度
$(window).resize(function(){
	$('#dataList').datagrid('resize');
});

//操作
function addOper(val,row){
	var operHtml = '';
	operHtml += '<a class="oper" href="javascript:;" onclick="openDetailDialog('+row.id+')">查看</a>&nbsp;';
	operHtml += '<a class="oper" href="javascript:;" onclick="openFormDialog('+row.id+')">修改</a>&nbsp;';
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
	var url = '${path}/UserController/toDetailView.do?id='+id;
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
	var url = '${path}/UserController/toFormView.do'+(id!=null ? '?id='+id : '');
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
		success: function(json){
			json = eval("("+json+")");
			if (json.success){
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
				$.messager.alert('错误提示', json.result);
			}
		}
	});
}

//删除
function deleteUser(id){
	$.get('${path}/UserController/delete.do',{id:id},function(json){
		if(json.success){
			$('#dataList').datagrid('reload');
		}else{
			$.messager.alert('错误提示', json.result);
		}
	});
}
</script>
