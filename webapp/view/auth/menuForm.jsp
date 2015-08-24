<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<form id="menuForm" action="${path}/MenuController/save.do" method="post">
	<input type="hidden" id="menuObjId" name="id" value="${menu.id }" />
	<input type="hidden" id="parentMenuObjId" name="parentId" value="${menu.parentId }" />
	<input type="hidden" name="treeLevel" value="${menu.treeLevel }" />
	<table border="1" class="ftable">
	<tbody>
		<tr>
			<td class="flabel">上级菜单:</td>
			<td class="fcontent"><span>${menu.parent.menuName }</span></td>
		</tr>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>菜单名称:</td>
			<td class="fcontent">
				<input type="text" name="menuName" maxlength="100" class="required" value="${menu.menuName }">
			</td>
		</tr>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>关联资源:</td>
			<td class="fcontent">
				<input type="text" id="tree_node_id" name="resId" value="${menu.resId}" />
				<input type="text" size="50" id="tree_node_text" name="resUrl" onclick="openFormDialog2();" class="required" value="${menu.resource.resName}">
			</td>
		</tr>
		<tr>
			<td class="flabel">资源描述:</td>
			<td class="fcontent"><textarea maxlength="255" name="menuDesc" rows="4" cols="60">${menu.menuDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2"><input type="button" onclick="submit22();" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
	</table>
</form>

<!-- 表单弹出窗口 -->
<div id="userFormDialog" class="easyui-dialog" closed="true"></div>

<script type="text/javascript">
$(document).ready(function() {
	//验证表单
	//$("#menuForm").validate();


});

//打开表单窗口
function openFormDialog2(id){
	var url = '${path}/ResourceController/toAllotResourceView.do';
	$("#userFormDialog").dialog({
		title: '选择菜单关联资源',
		href: url,
		width: 250,
		height: 300,
		closed: false,
		cache: false,
		modal: true
	});
}

function submit22(){
	//alert(1)
	$('#menuForm').ajaxSubmit({
		dataType: 'json',
		success: function(json){
			if(json.success){
				var menuObjId = $('#menuObjId').val();
				//修改
				if(menuObjId){
					//更新节点名称
					var node = $('#menuTree').tree('getSelected');
					$('#menuTree').tree('update', {target: node.target, text: $('input[name=resName]').val()});
					//刷新表单域
					$('#menuInfo').load('${path}/MenuController/toMenuDetailView.do', {id: menuObjId});
				}
				//新增
				else{
					//刷新表单域
					var node = $('#menuTree').tree('getSelected');
					$('#menuInfo').load('${path}/MenuController/toMenuDetailView.do', {id: node.id});
					
					//刷新树节点
					$('#menuTree').tree('reload', node.target);
				}
			}else{
				alert(json.result);
			}
		},
		error: function(msg){
			alert(msg);
		}
	});
}

</script>
