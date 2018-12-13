package com.messenger.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.messenger.model.User;

@Controller
//@RequestMapping("/")
public class LoginController {

    @GetMapping("/register")
    public ModelAndView welcome() {
    	ModelAndView mv = new ModelAndView("register2");
    	//mv.addObject("user",new User());
    	return mv;
    }
    
    @GetMapping("/login")
    public ModelAndView login() {
    	ModelAndView mv = new ModelAndView("welcome1");
    	mv.addObject("user",new User());
    	return mv;
    }
    
}
