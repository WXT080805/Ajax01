package com.zks.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zks.model.User;
import com.zks.service.impl.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/sys")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/getAllUser")
	@ResponseBody
	public List<User> getAllUser(Model model,HttpServletResponse response){
		List<User> list=null;
		list=userService.getAllUser();
		return list;
	}

}
