package com.echo.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.echo.domain.vo.Login;

@RequestMapping("/marketer") 
@Controller
public class WebMarketerController {
	
	@RequestMapping(value="/signin",method=RequestMethod.GET)
	public String goSignin(Map<String, Object> map){
		map.put("login", new Login()); 
		return "webmarketerview/marketerSignin";
	}

}
