<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
<script type="text/javascript">
$(function(){
	$('#loginForm').submit(function(){
		var userName = $('#userName').val();
		var password = $('#password').val();
		if($.trim(userName) == ''){
			$('#tip').show().html('请输入用户名');
			return false;
		}
		if($.trim(password) == ''){
			$('#tip').show().html('请输入密码');
			return false;
		}
		
		$(this).ajaxSubmit({
			success: function(json) {
				if (json.success){
					window.location.href = '${path}/index.jsp';
				}else{
					//$.messager.alert('错误提示', json.result);
					$('#tip').show().html(json.result);
				}
			}
		});
		return false;
	});
});
</script>
<style type="text/css">
input{
	margin: 0;
	padding: 0;
}
.divlist{
	margin-bottom:10px;
}
.username{
	width:210px;
	height: 25px;
}
.submitbut{
	width:210px;
	height: 35px;
}
.tip{
	border: 1px solid #f00;width: 210px; height:20px;
	display: none;
}
</style>
</head>
<body>
<div style="margin:0 auto; width:350px;">
<div class="easyui-panel" title="Login" style="padding:30px 70px 20px 70px;">
<form id="loginForm" action="${path}/j_spring_security_check" method="post" style="text-align:center;">
	<div class="divlist">
		<div id="tip" class="tip"></div>
	</div>
	
	<div class="divlist">
		<input type="text" id="userName" name="userName" class="username" placeholder="用户名" />
	</div>
	<div class="divlist">
		<input type="password" id="password" name="password" class="username" placeholder="密码" />
	</div>
	
	<div class="divlist">
		<input type="submit" class="submitbut" value="登 录" />
	</div>
</form>
</div>
</div>
</body>
</html>