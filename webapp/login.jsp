<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<html>
<head>
<%@ include file="/view/common/head.jsp" %>
</head>
<body>
<div style="margin:0 auto; width:400px;">
<div class="easyui-panel" title="Login to system" style="padding:30px 70px 20px 70px;">
	<div style="margin-bottom:10px">
		<input class="easyui-textbox" style="width:100%;height:40px;padding:12px" 
			data-options="prompt:'用户名',iconCls:'icon-man',iconWidth:38">
	</div>
	<div style="margin-bottom:20px">
		<input class="easyui-textbox" type="password" style="width:100%;height:40px;padding:12px" 
			data-options="prompt:'密码',iconCls:'icon-lock',iconWidth:38" />
	</div>
	<div style="margin-bottom:20px">
		<input type="checkbox" checked="checked">
		<span>Remember me</span>
	</div>
	<div>
		<a href="${path}/index.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
			<span style="font-size:14px;">登录</span>
		</a>
	</div>
</div>
</div>
</body>
</html>