<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>
<div class="mbody">

<div style="float:left;width:200px; border:1px solid #95b8e7;">
	<ul id="menuTree" data-options="method:'get',animate:true"></ul>
</div>

<div style="float: left; min-width: 500px;margin-left:5px;">
	<div class="box-positon">
		<form class="ropt">
			<input type="button" id="addResourceBut" class="submit" value="新增" /> &nbsp; 
			<input type="button" id="updateResourceBut" class="reset" value="修改" /> &nbsp; 
			<input type="button" id="deleteResourceBut" class="del-button" value="删除" /> &nbsp; 
		</form>
		<div class="clear"></div>
	</div>
	
	<div id="resourceInfo"></div>
</div>

</div>
</body>
</html>

<script type="text/javascript">
$(function(){
	$('#menuTree').tree({
		url:'${path}/ResourceController/getResourceList.do',
		onClick: function(node){
			$('#resourceInfo').load('${path}/ResourceController/toDetailView.do', {id: node.id});
		}
	});
	
	//新增子节点
	$('#addResourceBut').click(function(){
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要修改的节点！'); return ;
		}
		var id = node.id;
		var data = {};
		if(id != '0'){
			data.parentId = id;
		}

		$('#resourceInfo').load('${path}/ResourceController/toFormView.do', data);
	});

	//修改
	$('#updateResourceBut').click(function(){
		var node = $('#menuTree').tree('getSelected');
		if(node==null){
			alert('请选择要修改的节点！'); return ;
		}else if(node.id == '0'){
			alert('该节点不能修改！'); return ;
		}
		$('#resourceInfo').load('${path}/ResourceController/toFormView.do', {id: node.id});
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
			$.getJSON('${path}/ResourceController/removeAll.do', {id: (id=='-1'?'':id)}, function(json){
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
						$('#resourceInfo').load('${path}/ResourceController/toDetailView.do', {id: pnode.id});
					}else{
						//刷新树节点
						//ResourceTree.refreshItem('-1');
						var node = $('#menuTree').tree('find', 0);
						$('#menuTree').tree('reload', node.target);
					}
				}
			});
		}
	});
});
</script>
