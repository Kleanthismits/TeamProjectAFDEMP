package com.messenger.controller;

import com.messenger.exception.ResourceNotFoundException;
import com.messenger.model.Message;
//import com.example.easynotes.model.Note;
import com.messenger.repository.MessageRepository;
//import com.example.easynotes.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

//revised at 15:24 11/12/2018

@Controller
//@RequestMapping("/api")
public class MessageController {

    @Autowired
    MessageRepository messageRepository;
    
//    @GetMapping("/getAllmessages")
//    public ModelAndView findByNameSorted() {
//       List<Message> messageList = messageRepository.getAllMessages();
//        ModelAndView mv = new ModelAndView("showMessages");
//        mv.addObject(messageList);
//        return mv;
// 
//    }

    //Method that Shows All Messages
    @GetMapping("/messages")
    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }

    //Method that Creates a New Message
    @PostMapping("/messages")
    public Message createMessage(@Valid @RequestBody Message message) {
        return messageRepository.save(message);
    }

    //Method that Shows a Message with a certain Id
    @GetMapping("/messages/{id}")
    public Message getMessageById(@PathVariable(value = "id") Long messageId) {
        return messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));
    }
  
    //Method that Updates the attributes of a Message with a certain Id
    @PutMapping("/messages/{id}")
    public Message updateMessage(@PathVariable(value = "id") Long messageId,@Valid @RequestBody Message messageDetails) {

        Message message = messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));

       // message.setSender_id(messageDetails.getSender_id());
        message.setReceiver_id(messageDetails.getReceiver_id());
        message.setRead_status(messageDetails.getRead_status());
       // message.setSender_id(messageDetails.getSender_id());
        message.setReceiver_id(messageDetails.getReceiver_id());
        message.setSubject(messageDetails.getSubject());
        message.setText_content(messageDetails.getText_content());

        Message updatedMessage = messageRepository.save(message);
        return updatedMessage;
    }
  
    //Method that Deletes a Message with a certain Id
    @DeleteMapping("/messages/{id}")
    public ResponseEntity<?> deleteMessage(@PathVariable(value = "id") Long messageId) {
        Message message = messageRepository.findById(messageId).orElseThrow(() -> new ResourceNotFoundException("Message", "id", messageId));

        messageRepository.delete(message);

        return ResponseEntity.ok().build();
    }
}
