package com.messenger.controller;

import com.messenger.exception.ResourceNotFoundException;
import com.messenger.model.User;
import com.messenger.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@SessionAttributes("user")
public class UserController {

	@Autowired
	UserRepository userRepository;
	
	 @ModelAttribute("user")
	    public User getUser () {
	        return new User();
	    }

	@PostMapping("/loggedIn")
	public ModelAndView home(@ModelAttribute("user") User user,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		String userNotFound = "Wrong username or password";
		String password = user.getPassword();
		User user2 = userRepository.findByUsername(user.getUsername());
		if (user2 != null) {
			user = userRepository.findByUsername(user.getUsername());
				if (user2.getPassword().equals(password)) {
					String welcomeUser = user.getUsername();
					String userRole = user.getRole();
					mv.addObject("welcomeUser", welcomeUser);
					mv.addObject("userRole", userRole);
					mv.addObject("user", user);
					mv.setViewName("user3");
				}else {
					mv.addObject("userNotFound", userNotFound);
					mv.setViewName("forward:/login");
					mv.addObject("user", new User());
				}
		}else {
			mv.addObject("userNotFound", userNotFound);
			mv.setViewName("forward:/login");
			mv.addObject("user", new User());
		}
		return mv;
	}
	@GetMapping("/loggedIn")
	public ModelAndView returnFromShowUser(@ModelAttribute("user") User user,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		System.out.println("Role: " +user.getRole());
					String welcomeUser = user.getUsername();
					String userRole = user.getRole();
					mv.addObject("userRole", userRole);
					mv.addObject("user", user);
					mv.setViewName("user3");
		return mv;
	}
	
	// Method that Shows All Users
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
		User user2 = new User();
		user2.setPassword(user.getPassword());
		user2.setUsername(user.getUsername());
		userRepository.save(user2);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",user);
		mv.setViewName("userDetails");
		return mv;
	}
	
    @GetMapping("showCreateMessage")
    public ModelAndView showCreateMessage(@ModelAttribute("user") User user) {
    	List<User> userList = userRepository.findByNameSorted();
    	ModelAndView mv = new ModelAndView();
    	mv.addObject(userList);
    	mv.addObject("user", user);
    	mv.setViewName("sendNewMessageFinal");
    	return mv;
    }
	
//	@PostMapping("/registerUser")
//	public ModelAndView registerUser(User user) {
//		userRepository.save(user);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("user", new User());
//		mv.setViewName("welcome1");
//		return mv;
//	}
	
	//change
	@PostMapping("/registerUser")
	public ModelAndView registerUser(@RequestParam String username,@RequestParam String password) {
		User newUser= new User();
		newUser.setUsername(username);
		newUser.setPassword(password);
		userRepository.save(newUser);
		ModelAndView mv = new ModelAndView();
		//mv.addObject("user", new User());
		mv.setViewName("welcome1");
		return mv;
	}

//  //Method that Shows a User with a certain Id
//  @GetMapping("/users/{id}")
//  public User getUserById(@PathVariable(value = "id") Long userId) {
//      return userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
//  }
	@GetMapping("/getUser")
	public ModelAndView getNoteById(@RequestParam Long userId) {
		ModelAndView mv = new ModelAndView("userDetails");
		String userNotFound = "User with id: " + userId + " not found!";
		Optional<User> user = userRepository.findById(userId);
		if (!(user.isPresent())) {
			mv.addObject("userNotFound", userNotFound);
			mv.addObject("user", new User());
			return mv;
		} else {
			mv.addObject("user", user);
			return mv;
		}
	}

	@GetMapping("/findByNameSorted")
	public ModelAndView findByNameSorted(@ModelAttribute("user")User user,User userDetails) {
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView("showUser");
		mv.addObject("userDetails",userDetails);
		mv.addObject("user",user);
		mv.addObject(userList);
		return mv;

	}

	// Method that Updates the attributes of a User with a certain Id
	@PostMapping("/updateUser")
	public ModelAndView updateUser(@ModelAttribute("user")User user,@RequestParam Long userId,@RequestParam String userUsername,
			@RequestParam String userRole,@RequestParam String userPassword) {
		User user2 = userRepository.findById(userId)
				.orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
		if ((userUsername == null) || (userUsername.equals(""))) {
			user2.setUsername(user2.getUsername());
		} else {
			user2.setUsername(userUsername);
		}
		if ((userPassword == null) || (userPassword.equals(""))) {
			user2.setPassword(user2.getPassword());
		} else {
			user2.setPassword(userPassword);
		}
		if ((userRole == null) || (userRole.equals(""))) {
			user2.setRole(user2.getRole());
		} else {
			user2.setRole(userRole);
		}
		
		userRepository.save(user2);
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView();
		String userUpdated = "User succesfully updated";
	
		mv.addObject("userUpdated", userUpdated);
		//mv.addObject("userDetails",userDetails);
		mv.addObject("user",user);
		mv.addObject(userList);
		mv.setViewName("showUser");
		return mv;
	}
	
    @GetMapping("/findByNameSortedToSend")
	public ModelAndView findByNameSortedToSend() {
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView("sendMessage");
		mv.addObject(userList);
		return mv;

	}

	@PostMapping("/deleteUser")
	public ModelAndView deleteUser(@RequestParam Long userId, User userDetails) {
		User user = userRepository.findById(userId)
				.orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
		userRepository.delete(user);
		List<User> userList = userRepository.findByNameSorted();
		String userDeleted = "User succesfully deleted";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userDeleted", userDeleted);
		mv.addObject("obj", userDetails);
		mv.addObject(userList);
		mv.setViewName("showUser");

		return mv;
	}
}
