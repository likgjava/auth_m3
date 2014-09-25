<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>
<ul>
  <li><a href="javascript:;" onclick="showPage('用户列表','${path}/user/toList.do')">用户列表</a></li>
  <li><a href="javascript:;" onclick="showPage('角色列表','${path}/role/toList.do')">角色列表</a></li>
</ul>
<script type="text/javascript">
function showPage(name, url){
	/**
	if(($('#mainPanel').tabs('exists', name))){
		$('#mainPanel').tabs('select', name);
	}else{
		$('#mainPanel').tabs('add',{
			title: name,
			//href: url,
			content: '<iframe frameborder="0"  src="'+url+'" style="width:100%; height:100%;"></iframe>',
			closable: true
		});
	}
	*/
	
	$('#mainPanel').panel({
		href: url,
		onLoad: function(){
		}
	});
	
}
</script>
