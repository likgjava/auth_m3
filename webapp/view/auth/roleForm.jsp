<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<div>
<form id="roleForm" method="post">
	<input type="hidden" name="id" value="${role.id }" />
	<table>
		<tr>
			<td width="40%" align="right">角色名称：</td>
			<td><input type="text" name="roleName" value="${role.roleName }" class="easyui-validatebox" data-options="required:true" /></td>
		</tr>
	</table>
</form>
</div>
