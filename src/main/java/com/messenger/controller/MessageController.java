package com.messenger.controller;

import com.messenger.exception.ResourceNotFoundException;
import com.messenger.model.Message;
import com.messenger.model.User;
//import com.example.easynotes.model.Note;
import com.messenger.repository.MessageRepository;
import com.messenger.repository.UserRepository;
import com.messenger.util.GeneratedPdfReport;

//import com.example.easynotes.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

//revised at 15:24 11/12/2018

@Controller
@SessionAttributes("user")
public class MessageController {

    @Autowired
    MessageRepository messageRepository;
    @Autowired
    UserRepository userRepository;
    
    @GetMapping("/getAllMessages")
    public ModelAndView getAllMessages() {
       List<Message> messageList = messageRepository.getAllMessages();
       for(Message m : messageList) {
    	   m.setSenderName(userRepository.findCustomById(m.getSender_id()));
    	   m.setReceiverName(userRepository.findCustomById(m.getReceiver_id()));
       }
        ModelAndView mv = new ModelAndView("showMessages");
        mv.addObject(messageList);
        return mv;
 
    }
    
    @GetMapping("/findReceivedMessages")
    public ModelAndView getReceivedMessages(User user) {
    	String messageType = "Received Messages";
       List<Message> messageList = messageRepository.findReceivedMessages(user.getId());
       for(Message m : messageList) {
    	   m.setSenderName(userRepository.findCustomById(m.getSender_id()));
       }
        ModelAndView mv = new ModelAndView("showMessages");
        for (Message m : messageList) {
        }
        mv.addObject("user",user);
        mv.addObject("messageType", messageType);
        mv.addObject(messageList);
        return mv;
    }
    
    @GetMapping("/getSentMessages")
    public ModelAndView getSentMessages(@ModelAttribute("user") User user) {
    	String messageType = "Sent Messages";
       List<Message> messageList = messageRepository.findSentMessages(user.getId());
       for(Message m : messageList) {
    	   m.setReceiverName(userRepository.findCustomById(m.getReceiver_id()));
       }
        ModelAndView mv = new ModelAndView("showMessagesSimple");
        mv.addObject("user",user);
        mv.addObject("messageType", messageType);
        mv.addObject(messageList);
        return mv;
 
    }
    
    @GetMapping(value = "/pdfReport", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity<InputStreamResource> messagesReport(@ModelAttribute("user") User user) throws IOException {

    	 List<Message> messageList = messageRepository.getAllMessages();
         for(Message m : messageList) {
      	   m.setReceiverName(userRepository.findCustomById(m.getReceiver_id()));
      	   m.setSenderName(userRepository.findCustomById(m.getSender_id()));
         }
        ByteArrayInputStream bis = GeneratedPdfReport.messagesReport(messageList);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=messagesreport.pdf");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_PDF)
                .body(new InputStreamResource(bis));
    }
    //Method that Creates a New Message
    @PostMapping("createMessage")
	public ModelAndView createMessage(Message message, User user) {
		Message message2 = new Message();
		message2.setSubject(message.getSubject());
		message2.setText_content(message.getText_content());
		message2.setSender_id(message.getSender_id());
		message2.setReceiver_id(message.getReceiver_id());
		//message2.setUsername(user.getUsername());
		
		System.out.println(user.getUsername());
		System.out.println(userRepository.findCustomById(message2.getReceiver_id()));
		if(message2.getReceiver_id()==message2.getSender_id()) {
			message2.setSubject("Self Note: " + message.getSubject());
		}
		messageRepository.save(message2);
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView();
		mv.addObject("userList",userList);
		mv.addObject("user",user);
		mv.addObject("message",message);
		mv.setViewName("sendNewMessageFinal");
		return mv;
	}

    //Method that Shows a Message with a certain Id
    @GetMapping("/messages/{id}")
    public Message getMessageById(@PathVariable(value = "id") Long messageId) {
        return messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));
    }
    
    @GetMapping("showMessage/{id}")
    public ModelAndView seeMessageById(@PathVariable(value ="id") Long id) {
    	ModelAndView mv = new ModelAndView();
    	Message message2 = messageRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Message", "id", id));
    	String receiver = userRepository.findCustomById(message2.getReceiver_id());
    	System.out.println(receiver + "receiver");
    	mv.addObject("receiver",receiver);
    	mv.setViewName("viewMessage");
    	mv.addObject("message", message2);
        return mv;
    }
    
  //Method that Hides a Sent Message with a certain Id
    @PutMapping("/hideDeleteSentMessage/{id}")
    public ModelAndView HideDeleteSentMessage(@ModelAttribute("user") User user,@PathVariable(value = "id") Long messageId) {
        Message message = messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));
        message.setSender_view(true);
        Message updatedMessage = messageRepository.save(message);
        ModelAndView mv=getSentMessages(user);
        mv.addObject(updatedMessage);
        return mv;
        
    }

    //Method that Updates the attributes of a Message with a certain Id
//    @PutMapping("/messages/{id}")
//    public Message updateMessage(@PathVariable(value = "id") Long messageId,@Valid @RequestBody Message messageDetails) {
//
//        Message message = messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));
//
//       // message.setSender_id(messageDetails.getSender_id());
//        message.setReceiver_id(messageDetails.getReceiver_id());
//        message.setRead_status(messageDetails.getRead_status());
//       // message.setSender_id(messageDetails.getSender_id());
//        message.setReceiver_id(messageDetails.getReceiver_id());
//        message.setSubject(messageDetails.getSubject());
//        message.setText_content(messageDetails.getText_content());
//
//        Message updatedMessage = messageRepository.save(message);
//        return updatedMessage;
//    }
    
 // Method that Updates the attributes of a User with a certain Id
    

 	@PostMapping("showMessage/updateMessage")
 	public ModelAndView updateUser(@ModelAttribute("user") User user,@RequestParam Long id, Message messageDetails) {

 		Message message = messageRepository.findById(id)
 				.orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
 		if ((messageDetails.getSubject() == null) || (messageDetails.getSubject().equals(""))) {
 			message.setSubject(message.getSubject());
 		} else {
 			message.setSubject(messageDetails.getSubject());
 		}
 		if ((messageDetails.getText_content() == null) || (messageDetails.getText_content().equals(""))) {
 			message.setText_content(message.getText_content());
 		} else {
 			message.setText_content(messageDetails.getText_content());
 		}
 		Message updatedUpdated = messageRepository.save(message);
 		List<Message> messageList = messageRepository.findSentMessages(user.getId());
 		ModelAndView mv = new ModelAndView();
 		String userUpdated = "User succesfully updated";
 		mv.addObject("userUpdated", userUpdated);
 		mv.addObject("obj", messageDetails);
 		mv.addObject(messageList);
 		mv.setViewName("viewMessage");
 		return mv;
 	}
  
    //Method that Deletes a Message with a certain Id
    @GetMapping("/deleteMessage")
    public ModelAndView deleteMessage(Message message ,@ModelAttribute("user") User user) {
    	ModelAndView mv = new ModelAndView();
        Message message2 = messageRepository.findById(message.getId()).orElseThrow(() -> new ResourceNotFoundException("Message", "id", message.getId()));
        messageRepository.delete(message2);
        List<Message> messageList = messageRepository.findSentMessages(user.getId());
       mv.setViewName("showMessagesSimple");
        mv.addObject("user",user);
        mv.addObject(messageList);
        return mv;
    }
}
