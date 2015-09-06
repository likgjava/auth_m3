<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<table border="1" class="ftable">
<tbody>
	<tr>
		<td class="flabel">标题:</td>
		<td class="fcontent">${insideLetter.title }</td>
	</tr>
	<tr>
		<td class="flabel">发件人:</td>
		<td class="fcontent">${insideLetter.sendUserName }</td>
	</tr>
	<tr>
		<td class="flabel">发送时间:</td>
		<td class="fcontent">${insideLetter.createTime }</td>
	</tr>
	<tr>
		<td class="flabel">内容:</td>
		<td class="fcontent">${insideLetter.content}</td>
	</tr>
</tbody>
</table>
