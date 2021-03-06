<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
<style type="text/css">
.unread{
	font-weight: bold;
}
</style>
</head>
<body>

<div class="mbody">

<div class="easyui-tabs" data-options="tools:'#tab-tools'">
<div title="收件箱" style="padding:10px">
	<table id="inboxList" class="easyui-datagrid"
		url='${path}/InsideLetterController/getPage.do?boxType=inbox'
		data-options="rownumbers:true,singleSelect:true,pagination:true,pageSize:10,method:'post',toolbar:'#tb',fitColumns:true">
		<thead>
			<tr>
				<th data-options="field:'title',width:80, formatter:forTitle">标题</th>
				<th data-options="field:'content',width:80">内容</th>
				<th data-options="field:'sendUserName',width:80">发件人</th>
				<th data-options="field:'createTime',width:80">创建时间</th>
				<th data-options="field:'oper', formatter:addOper">操作</th>
			</tr>
		</thead>
	</table>
</div>
<div title="发件箱" style="padding:10px">
	<table id="outboxList" class="easyui-datagrid"
		url='${path}/InsideLetterController/getPage.do?boxType=outbox'
		data-options="rownumbers:true,singleSelect:true,pagination:true,pageSize:10,method:'post',toolbar:'#tb',fitColumns:true">
		<thead>
			<tr>
				<th data-options="field:'title',width:80">标题</th>
				<th data-options="field:'content',width:80">内容</th>
				<th data-options="field:'createUsername',width:80">发件人</th>
				<th data-options="field:'createTime',width:80">创建时间</th>
				<th data-options="field:'oper', formatter:addOper">操作</th>
			</tr>
		</thead>
	</table>
</div>
</div>

<div id="tab-tools">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="toSendView()">发信息</a>
</div>




<!-- 详情弹出窗口 -->
<div id="userDetailDialog" class="easyui-dialog" closed="true"></div>

</div>

</body>
</html>

<script type="text/javascript">
//自适应窗口宽度
$(window).resize(function(){
	$('#inboxList').datagrid('resize');
});

//标题
function forTitle(val,row){
	var operHtml = '';
	if(row.isRead){
		operHtml += '<a href="javascript:;" onclick="openDetailDialog('+row.id+')">'+val+'</a>';
	}else{
		operHtml += '<a class="unread" href="javascript:;" onclick="openDetailDialog('+row.id+')">'+val+'</a>';
	}
	return operHtml;
}
//操作
function addOper(val,row){
	var operHtml = '';
	operHtml += '<a class="oper" href="javascript:;" onclick="openDetailDialog('+row.id+')">查看</a>&nbsp;';
	operHtml += '<a class="oper" href="javascript:;" onclick="deleteUser('+row.id+')">删除</a>&nbsp;';
	return operHtml;
}
//发消息
function toSendView(){
	window.location.href = '${path}/InsideLetterController/toSendInsideLetterView.do';
}


//打开详情窗口
function openDetailDialog(id){
	var url = '${path}/InsideLetterController/toDetailView.do?id='+id;
	$("#userDetailDialog").dialog({
		title: '站内信',
		href: url,
		width: 400,
		height: 200,
		closed: false,
		cache: false,
		modal: true
	});
}


//删除
function deleteUser(id){
	$.get('${path}/UserController/delete.do',{id:id},function(json){
		if(json.success){
			$('#inboxList').datagrid('reload');
		}else{
			$.messager.alert('错误提示', json.result);
		}
	});
}
</script>
