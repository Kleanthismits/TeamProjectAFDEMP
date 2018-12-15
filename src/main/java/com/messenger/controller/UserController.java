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
//@RequestMapping("/api")
@SessionAttributes("user")
public class UserController {

	@Autowired
	UserRepository userRepository;
	//static User user2;
	
	 @ModelAttribute("user")
	    public User getUser () {
	        return new User();
	    }

	@PostMapping("/loggedIn")
	public ModelAndView home(@ModelAttribute("user") User user,BindingResult result) {
		ModelAndView mv = new ModelAndView();
		String userNotFound = "Wrong username or password";
		user = userRepository.findByUsername(user.getUsername());
		//user2 = userRepository.findByUsername(user.getUsername());
		if (user != null) {
				if (user.getPassword().equals(user.getPassword())) {
					String welcomeUser = user.getUsername();
					mv.addObject("welcomeUser", welcomeUser);
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
					String welcomeUser = user.getUsername();
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
	
	@PostMapping("/registerUser")
	public ModelAndView registerUser(User user) {
		userRepository.save(user);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
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
	public ModelAndView findByNameSorted() {
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView("showUser");
		mv.addObject(userList);
		return mv;

	}

	// Method that Updates the attributes of a User with a certain Id
	@PostMapping("/updateUser")
	public ModelAndView updateUser(@RequestParam Long userId, User userDetails) {

		User user = userRepository.findById(userId)
				.orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
		if ((userDetails.getUsername() == null) || (userDetails.getUsername().equals(""))) {
			user.setUsername(user.getUsername());
		} else {
			user.setUsername(userDetails.getUsername());
		}
		if ((userDetails.getPassword() == null) || (userDetails.getPassword().equals(""))) {
			user.setPassword(user.getPassword());
		} else {
			user.setPassword(userDetails.getPassword());
		}
		if ((userDetails.getRole() == null) || (userDetails.getRole().equals(""))) {
			user.setRole(user.getRole());
		} else {
			user.setRole(userDetails.getRole());
		}
		
		
//		user.setPassword(userDetails.getPassword());
//		user.setRole(userDetails.getRole());
		User updatedUser = userRepository.save(user);
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj", userDetails);
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

	// Method that Deletes a User with a certain Id
//	@DeleteMapping("/users/{id}")
//	public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long userId) {
//		User user = userRepository.findById(userId)
//				.orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
//
//		userRepository.delete(user);
//
//		return ResponseEntity.ok().build();
//	}
	@PostMapping("/deleteUser")
	public ModelAndView deleteUser(@RequestParam Long userId, User userDetails) {
		User user = userRepository.findById(userId)
				.orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

		userRepository.delete(user);
		List<User> userList = userRepository.findByNameSorted();
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj", userDetails);
		mv.addObject(userList);
		mv.setViewName("showUser");

		return mv;
	}
}
