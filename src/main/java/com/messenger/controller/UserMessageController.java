//package com.messenger.controller;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.messenger.model.Message;
//import com.messenger.repository.MessageRepository;
//import com.messenger.repository.UserRepository;
//
//@Controller
//public class UserMessageController {
//	@Autowired
//	UserRepository userRepository;
//	@Autowired
//	MessageRepository messageRepository;
//	
//    @GetMapping("/getSimpleAllmessages")
//    public ModelAndView findByNameSorted() {
//       List<Message> messageList = messageRepository.getAllMessages();
//       List<String> usernames = new ArrayList<>();
//       for(Message m : messageList) {
//    	   System.out.println(m.getSender_id());
//    	   m.setSender_id(sender_id);
//    	   usernames.add(userRepository.findCustomById(m.getSender_id()));
//       }
//       for(String s : usernames) {
//    	   System.out.println(s);
//       }
//        ModelAndView mv = new ModelAndView("showMessagesSimple");
//        mv.addObject(usernames);
//        mv.addObject(messageList);
//        return mv;
// 
//    }
//
//}
