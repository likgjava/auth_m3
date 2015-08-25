<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<div>
<table class="ftable">
	<tr>
		<td class="flabel">用户名：</td>
		<td class="fcontent">${user.userName }</td>
	</tr>
	<tr>
		<td align="right">分配角色：</td>
		<td>
			<c:forEach var="allottedRole" items="${user.roleList }" varStatus="status">
				<c:if test="${status.index > 0}">, </c:if>${allottedRole.roleName }
			</c:forEach>
		</td>
	</tr>
</table>
</div>
