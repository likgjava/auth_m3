<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<div>
	<div style="float: left; margin-left: 5px;border: 0px solid #f00;height: 100%;">
		<img alt="logo" height="49" src="${path}/css/logo.jpg" />
	</div>
	
	<div style="float: right; margin-right: 20px;border: 0px solid #f00;line-height: 35px;padding-top: 15px;">
		<a href="javascript:;" onclick="openNewWindow()">新窗口打开</a>
		<a href="${path}//LoginController/logout.do">退出</a>
	</div>
</div>
<script>
function openNewWindow(){
	window.open($('#mainFrame').attr('src'))
}
</script>