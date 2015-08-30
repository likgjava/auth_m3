package com.likg.msg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.auth.service.UserService;
import com.likg.common.domain.EasyuiPage;
import com.likg.common.domain.JsonResult;
import com.likg.msg.domain.InsideLetter;
import com.likg.msg.service.InsideLetterService;

@Controller
@RequestMapping("/InsideLetterController")
public class InsideLetterController {
	
	private static Logger log = Logger.getLogger(InsideLetterController.class);
	
	@Resource
	private UserService userService;
	
	@Resource
	private InsideLetterService insideLetterService;

	/**
	 * 跳转到列表页面
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:05:17
	 */
	@RequestMapping("/toList")
	public String toList() {
		return "view/msg/insideLetterList";
	}
	
	/**
	 * 分页获取列表数据
	 * @param user 查询参数
	 * @param page 分页信息
	 * @return
	 * @author likaige
	 * @create 2014年9月24日 下午3:10:29
	 */
	@ResponseBody
	@RequestMapping("/getPage")
	public EasyuiPage<InsideLetter> getPage(String boxType, EasyuiPage<InsideLetter> page) {
		try {
			page = insideLetterService.getPage(page, boxType);
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return page;
	}
	
	/**
	 * 跳转到用户详情页面
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:06:31
	 */
	@RequestMapping("/toDetailView")
	public ModelAndView toDetailView(Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			//获取用户信息
			//InsideLetter user = userService.getInsideLetter(id);
			//model.put("user", user);
			
			//获取用户已分配的角色
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return new ModelAndView("view/auth/InsideLetterDetail", model);
	}
	
	/**
	 * 跳转到维护页面
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:06:31
	 */
	@RequestMapping("/toSendInsideLetterView")
	public ModelAndView toSendInsideLetterView(Integer id) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
		} catch (Exception e) {
			log.error("出现异常：", e);
		}
		return new ModelAndView("view/msg/sendInsideLetter", model);
	}
	
	/**
	 * 保存
	 * @param user
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午4:48:41
	 */
	@ResponseBody
	@RequestMapping("/save")
	public JsonResult save(User user) {
		JsonResult result = JsonResult.getInstance();
		try {
			userService.saveUser(user);
		} catch (Exception e) {
			result = JsonResult.getFailResult(e.toString());
			log.error("出现异常：", e);
		}
		return result;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 * @author likaige
	 * @create 2014年3月13日 下午5:00:06
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public JsonResult delete(int id) {
		JsonResult result = JsonResult.getInstance();
		try {
			userService.delete(id);
		} catch (Exception e) {
			result = JsonResult.getFailResult(e.toString());
			log.error("出现异常：", e);
		}
		return result;
	}
	
}
