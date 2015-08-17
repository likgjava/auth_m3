<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/view/common/taglibs.jsp" %>

<ul id="menuTree" data-options="url:'${path}/MenuController/getMenuTree.do',method:'get',animate:true"></ul>


<script type="text/javascript">
$(function(){
	$('#menuTree').tree({
		onClick: function(node){
			document.getElementById('mainFrame').src = '${path}'+node.url;
		}
	});
});




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
