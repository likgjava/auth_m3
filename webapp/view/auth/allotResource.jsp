<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<input type="button" id="addResourceBut" class="submit" value="确定" />

<div class="" style="width: 200px; border: 1px solid #95b8e7;">
<ul id="menuTree2" data-options="method:'get',animate:true">
</ul>
</div>





<script type="text/javascript">
$(function(){
	$('#menuTree2').tree({
		url:'${path}/ResourceController/getResourceList.do',
		onClick: function(node){
			//$('#resourceInfo').load('${path}/ResourceController/toResourceDetailView.do', {id: node.id});
		}
	});
	
	//新增子节点
	$('#addResourceBut').click(function(){
		//var id = ResourceTree.getSelectedItemId();
		var node = $('#menuTree2').tree('getSelected');
		if(node==null){
			alert('请选择节点！'); return ;
		}
		var id = node.id;
		if(id == '0'){
			alert('无效节点！'); return ;
		}

		//获取节点的层级数
		//data.resourceLevel = ResourceTree.getLevel(id);
		
		$('#tree_node_id').val(node.id);
		$('#tree_node_text').val(node.text);
		
		$('#userFormDialog').dialog('close');
	});

	
});

</script>
