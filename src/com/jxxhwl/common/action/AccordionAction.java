package com.jxxhwl.common.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jxxhwl.common.dao.UserDao;
import com.jxxhwl.common.entity.Accordion;
import com.jxxhwl.common.entity.User;
import com.jxxhwl.common.service.AccordionService;
import com.jxxhwl.jc.common.BaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class AccordionAction extends BaseAction{
	@Resource
	private AccordionService accordionService;
	private Map<String,Accordion> map;
	public Map<String, Accordion> getMap() {
		return map;
	}
	public void setMap(Map<String, Accordion> map) {
		this.map = map;
	}
	
	@Autowired
	UserDao userDao;
	/**
	 * 登录后的主页面
	 * @return
	 */
	public String main(){
		String name = "";
		String id = "";
		name = (String) session.getAttribute("name");
		id = (String) session.getAttribute("id");
		if(name == null) {
			Cookie[] cookies = request.getCookies();
            if(null!=cookies) {
                for (Cookie cookie : cookies) {
                	if("userId".equals(cookie.getName()) && cookie.getValue() != ""){
                		id = cookie.getValue();
                		User u = userDao.getUser(id);
                		if(u != null){
                			session.setAttribute("name", u.getUsername());
                			session.setAttribute("id", u.getId());
                			session.setAttribute("user", u);
                			break;
                		}
                	}
                }
            }
		}
		
		name = (String) session.getAttribute("name");
		id = (String) session.getAttribute("id");
		Map<String,Accordion> map = accordionService.getAccordionList(id);
		ActionContext.getContext().getValueStack().set("map", map);
		ActionContext.getContext().getValueStack().set("name", name);
		ActionContext.getContext().getValueStack().set("id", id);
		
		return "main";
	}
}
