package com.likg.common.domain;

/**
 * 用于传递AJAX请求的返回结果
 * @author likaige
 * @create 2015年8月20日 上午10:03:30
 */
public class JsonResult {

	/**
	 * 标记操作是否成功
	 * <br/>true:操作成功；false:操作失败
	 */
	private boolean success;
	
	/**
	 * 操作结果信息
	 */
	private String result;
	
	/**
	 * 生成操作成功的信息
	 * @return
	 * @author likaige
	 * @create 2015年8月20日 上午10:12:05
	 */
	public static JsonResult getInstance(){
		JsonResult json = new JsonResult();
		json.setSuccess(true);
		json.setResult("操作成功");
		return json;
	}
	
	/**
	 * 生成操作成功的信息
	 * @return
	 * @author likaige
	 * @create 2015年8月20日 上午10:12:05
	 */
	public static JsonResult getFailResult(String result){
		JsonResult json = new JsonResult();
		json.setSuccess(false);
		json.setResult(result);
		return json;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
}
