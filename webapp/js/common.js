


/**
 * 格式化日期，输出格式：yyyy-MM-dd HH:mm:ss
 * @param ms 毫秒
 */
function formatDate(ms){
	var d = new Date(ms);
	return d.getFullYear()+ '-' +(d.getMonth()+1)+ '-' +d.getDate()+ ' ' +d.getHours()+ ':' +d.getMinutes()+ ':' +d.getSeconds();
}