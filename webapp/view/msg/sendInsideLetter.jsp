<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>

<div class="mbody">
<form id="menuForm" action="${path}/InsideLetterController/save.do" method="post">
	<table border="1" class="ftable">
	<tbody>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>标题:</td>
			<td class="fcontent">
				<input type="text" name="title" maxlength="100" class="required" value="${menu.menuName }">
			</td>
		</tr>
		<tr>
			<td class="flabel"><span class="pn-frequired">*</span>收件人:</td>
			<td class="fcontent">
				<input type="text" name="recipient" maxlength="100" class="required" value="${menu.menuName }">
			</td>
		</tr>
		<tr>
			<td class="flabel">内容:</td>
			<td class="fcontent"><textarea maxlength="255" name="content" rows="3" cols="30">${menu.menuDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2">
				<input type="submit" class="submit" value="提交" />
			</td>
		</tr>
	</tbody>
	</table>
</form>
</div>

</body>
</html>

<script type="text/javascript">
$(function(){
	
	$('#menuForm').submit(function(){
		var userName = $('#userName').val();
		var password = $('#password').val();
		
		$(this).ajaxSubmit({
			success: function(json) {
				if (json.success){
					window.location.href = '${path}/InsideLetterController/toList.do';
				}else{
					$.messager.alert('错误提示', json.result);
					//$('#tip').show().html(json.result);
				}
			}
		});
		return false;
	});
});
</script>
