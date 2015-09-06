<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<form id="resourceForm" action="${path}/ResourceController/save.do" method="post">
<input type="hidden" id="resourceObjId" name="id" value="${resource.id }" />
<input type="hidden" id="parentResourceObjId" name="parentId" value="${resource.parentId }" />
<input type="hidden" name="treeLevel" value="${resource.treeLevel }" />
<table border="1" class="ftable">
	<tr>
		<td class="flabel">上级资源:</td>
		<td class="fcontent"><span>${resource.parent.resName }</span></td>
	</tr>
	<tr>
	<td class="flabel">资源ID:</td>
		<td class="fcontent">${resource.id }</td>
	</tr>
	<tr>
		<td class="flabel"><span class="pn-frequired">*</span>资源名称:</td>
		<td class="fcontent"><input type="text" name="resName" maxlength="100" class="required" value="${resource.resName }"></td>
	</tr>
	<tr>
		<td class="flabel"><span class="pn-frequired">*</span>资源路径:</td>
		<td class="fcontent"><input type="text" size="50" id="resUrl" name="resUrl" maxlength="100" class="required" value="${resource.resUrl }"></td>
	</tr>
	<tr>
		<td class="flabel">资源描述:</td>
		<td class="fcontent"><textarea maxlength="255" name="resDesc" rows="3" cols="30">${resource.resDesc }</textarea></td>
	</tr>
	<tr>
		<td class="pn-fbutton" colspan="4"><input type="button" onclick="submit22();" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
	</tr>
</table>
</form>

<script type="text/javascript">
$(document).ready(function() {
	//验证表单
	//$("#resourceForm").validate();


});

function submit22(){
	//alert(1)
	$('#resourceForm').ajaxSubmit({
		dataType: 'json',
		success: function(json){
			if(json.success){
				var resourceObjId = $('#resourceObjId').val();
				//修改
				if(resourceObjId){
					//更新节点名称
					//ResourceTree.setItemText(resourceObjId, $('input[name=resName]', '#resourceForm').val(), '');
					var node = $('#menuTree').tree('getSelected');
					$('#menuTree').tree('update', {target: node.target, text: $('input[name=resName]').val()});
					//刷新表单域
					$('#resourceInfo').load('${path}/ResourceController/toDetailView.do', {id: resourceObjId});
				}
				//新增
				else{
					//刷新表单域
					var node = $('#menuTree').tree('getSelected');
					$('#resourceInfo').load('${path}/ResourceController/toDetailView.do', {id: node.id});
					
					//刷新树节点
					//ResourceTree.refreshItem(ResourceTree.getSelectedItemId());
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
