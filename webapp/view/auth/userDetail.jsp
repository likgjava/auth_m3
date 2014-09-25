<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<div>
<table>
	<tr>
		<td width="40%" align="right">用户名：</td>
		<td>${user.userName }</td>
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
