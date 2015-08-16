<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<form id="resourceForm" action="${path}/ResourceController/save.do" method="post">
	<input type="hidden" id="resourceObjId" name="id" value="${resource.id }" />
	<input type="hidden" id="parentResourceObjId" name="parentId" value="${resource.parentId }" />
	<input type="hidden" name="treeLevel" value="${resource.treeLevel }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">上级资源:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><span>${resource.parent.resName }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>资源名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" name="resName" maxlength="100" class="required" value="${resource.resName }"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>资源路径:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" size="50" id="resUrl" name="resUrl" maxlength="100" class="required" value="${resource.resUrl }"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">资源描述:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><textarea maxlength="255" name="resDesc" rows="4" cols="60">${resource.resDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="4"><input type="button" onclick="submit22();" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
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
					$('#resourceInfo').load('${path}/ResourceController/toResourceDetailView.do', {id: resourceObjId});
				}
				//新增
				else{
					//刷新表单域
					var node = $('#menuTree').tree('getSelected');
					$('#resourceInfo').load('${path}/ResourceController/toResourceDetailView.do', {id: node.id});
					
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
