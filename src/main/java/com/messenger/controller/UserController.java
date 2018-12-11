package com.messenger.controller;

import com.messenger.exception.ResourceNotFoundException;
//import com.example.easynotes.model.Note;
import com.messenger.model.User;
//import com.example.easynotes.repository.NoteRepository;
import com.messenger.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;


@Controller
//@RequestMapping("/api")
public class UserController {

  @Autowired
  UserRepository userRepository;

  @RequestMapping("/")
  public ModelAndView home(User user) {
  	ModelAndView mv = new ModelAndView();
  	mv.addObject("obj",user);
  	mv.setViewName("userDetails");
  	System.out.println("HI theeeeeeeeeeeeeeeeeereeeeeeeeeeeeeeee");
  	return mv;
  }
  //Method that Shows All Users
  @GetMapping("/users")
  public List<User> getAllUsers() {
      return userRepository.findAll();
  }

//  //Method that Creates a New User
//  @PostMapping("/users")
//  public User createUser(@Valid @RequestBody User user) {
//      return userRepository.save(user);
//  }
  @PostMapping("/createUser")
  public ModelAndView createUser(User user) {
  	userRepository.save(user);
  	ModelAndView mv = new ModelAndView();
  	mv.addObject("obj",user);
  	mv.setViewName("userDetails");
  	
      return mv;
  }
//  //Method that Shows a User with a certain Id
//  @GetMapping("/users/{id}")
//  public User getUserById(@PathVariable(value = "id") Long userId) {
//      return userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
//  }
  @GetMapping("/getUser")
  public ModelAndView getNoteById(@RequestParam Long userId) {
  	ModelAndView mv = new ModelAndView("showUser");
  	
  	User user = userRepository.findById(userId)
  			.orElseThrow(() -> new ResourceNotFoundException("Note", "id", userId));
  	mv.addObject(user);
      return mv;
              
  }
  @GetMapping ("/findByNameSorted")
  public ModelAndView findByNameSorted() {
	  List<User> userList = userRepository.findByNameSorted();
	  ModelAndView mv = new ModelAndView("showUser");
	  mv.addObject(userList);
	  return mv;
 	  
  }
  //Method that Updates the attributes of a User with a certain Id
  @PutMapping("/users/{id}")
  public User updateNote(@PathVariable(value = "id") Long userId,@Valid @RequestBody User userDetails) {

      User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

      user.setUsername(userDetails.getUsername());
      user.setPassword(userDetails.getPassword());
      user.setRole(userDetails.getRole());

      User updatedUser = userRepository.save(user);
      return updatedUser;
  }
  
  //Method that Deletes a User with a certain Id
  @DeleteMapping("/users/{id}")
  public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long userId) {
      User user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

      userRepository.delete(user);

      return ResponseEntity.ok().build();
  }
}
