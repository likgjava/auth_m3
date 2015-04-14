<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<div style="margin: 5px;">
<table id="roleDataList" class="easyui-datagrid" title="角色列表"
	url='${path}/RoleController/getPage.do'
	data-options="rownumbers:true,singleSelect:true,pagination:true,pageSize:10,method:'post',toolbar:'#role_tb',fitColumns:true">
	<thead>
		<tr>
			<th data-options="field:'id',width:80">ID</th>
			<th data-options="field:'roleName',width:80">角色名称</th>
			<th data-options="field:'roleChName',width:80">角色名称</th>
			<th data-options="field:'roleDesc',width:80, formatter:showTip">角色名称</th>
			<th data-options="field:'createTime',width:80">创建时间</th>
			<th data-options="field:'oper',width:80, formatter:addOper">操作</th>
		</tr>
	</thead>
</table>

<div id="role_tb" style="height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openFormDialog();">新增角色</a>
	</div>
	<div style="margin: 3px;">
		角色名称: <input id="roleName" name="roleName" />
		<a href="javascript:;" onclick="searchData();" class="easyui-linkbutton" iconCls="icon-search">搜 索</a>
	</div>
</div>

<!-- 弹出窗口 -->
<div id="formDialog" class="easyui-dialog" closed="true" buttons="#formDialog-buttons"></div>
<div id="formDialog-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRole()">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formDialog').dialog('close')">取消</a>
</div>
</div>

<script type="text/javascript">
//自适应窗口宽度
$(window).resize(function(){
	$('#roleDataList').datagrid('resize');
});

function showTip(val,row){
	return '<span class="easyui-tooltip" title="'+val+'">' + val + '</span>';
}

//操作
function addOper(val,row){
	var operHtml = '';
	operHtml += '<a class="oper" href="#" onclick="openFormDialog('+row.id+')">修改</a>&nbsp;';
	operHtml += '<a class="oper" href="javascript:;" onclick="deleteRole('+row.id+')">删除</a>&nbsp;';
	return operHtml;
}

//搜 索
function searchData(){
	$('#roleDataList').datagrid('load', {
		roleName: $('#roleName').val()
	});
}

//打开表单窗口
function openFormDialog(id){
	var url = '${path}/RoleController/toRoleForm.do'+(id!=null ? '?id='+id : '');
	$("#formDialog").dialog({
		title: '角色维护',
		href: url,
		width: 350,
		height: 200,
		closed: false,
		cache: false,
		modal: true
	});
}

//保存
function saveRole(){
	$('#roleForm').form('submit',{
		url: '${path}/RoleController/save.do',
		dataType: 'json',
		onSubmit: function(param){
			return $(this).form('validate');
		},
		success: function(result){
			if (result == 'success'){
				$.messager.alert('', '添加成功！','',function(){
					$('#formDialog').dialog('close');
					$('#roleDataList').datagrid('reload');
				});
			}else{
				$.messager.alert('错误提示', result);
			}
		}
	});
}

//删除
function deleteRole(id){
	$.messager.confirm('', '确定删除该角色吗？', function(r){
		if(r){
			$.get('${path}/RoleController/delete.do',{id:id},function(json){
				if (json.result == 'success'){
					$('#roleDataList').datagrid('reload');
				}else{
					$.messager.alert('错误提示', json.result);
				}
			});
		}
	});
}
</script>
