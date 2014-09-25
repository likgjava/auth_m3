<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<div>
<form id="userForm" method="post">
<input type="hidden" name="id" value="${user.id }" />
<table>
	<tr>
		<td width="40%" align="right">用户名：</td>
		<td><input type="text" name="userName" value="${user.userName }" class="easyui-validatebox" data-options="required:true" /></td>
	</tr>
	<tr>
		<td align="right">分配角色：</td>
		<td>
			<input id="combo" type="text" />
			<div id="roleList">
				<div style="color:#99BBE8;background:#fafafa;padding:5px;">选择角色</div>
				<c:forEach var="allRole" items="${allRoleList }">
					<c:set var="isSelected" value="0" />
					<c:forEach var="allottedRole" items="${allottedRoleList }">
						<c:if test="${allRole.id == allottedRole.id}">
							<c:set var="isSelected" value="1" />
						</c:if>
					</c:forEach>
					<input style="vertical-align:middle;" type="checkbox" name="role" <c:if test="${isSelected == 1}">checked="checked"</c:if> value="${allRole.id }" /><span>${allRole.roleName }</span><br/>
				</c:forEach>
			</div>
		</td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript">
//获取选中的用户名
function getSelectedText(){
	var text = '';
	$('#roleList input:checked').each(function(i,dom){
		text += (i>0 ? ',' : '') + $(dom).next('span').text();
	});
	return text;
}

$(function(){
	//初始化下拉复选框
	$('#combo').combo({
		required:true,
		editable: false
	});
	$('#roleList').appendTo($('#combo').combo('panel'));
	$('#roleList input').click(function(){
		$('#combo').combo('setText', getSelectedText());
	});
	$('#combo').combo('setText', getSelectedText());
});
</script>