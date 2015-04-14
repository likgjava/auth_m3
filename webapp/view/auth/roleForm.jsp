<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<div>
<form id="roleForm" method="post">
	<input type="hidden" name="id" value="${role.id }" />
	<table>
		<tr>
			<td align="right">角色名称：</td>
			<td><input type="text" name="roleName" value="${role.roleName }" class="easyui-validatebox" data-options="required:true" /></td>
		</tr>
		<tr>
			<td align="right">中文名称：</td>
			<td><input type="text" name="roleChName" value="${role.roleChName }" /></td>
		</tr>
		<tr>
			<td align="right">角色描述：</td>
			<td><textarea name="roleDesc">${role.roleDesc }</textarea></td>
		</tr>
	</table>
</form>
</div>
