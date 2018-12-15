package com.messenger.repository;


import com.messenger.model.User;

import java.util.List;
//import com.example.easynotes.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;



@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	@Query("from User")
	List<User>findByNameSorted();
	
	@Query("Select u.username from User u")
	Iterable<String>findByUsername();
	
	@Query("from User where username = ?1")
	User findByUsername(String username);
	
	@Query("select u.username from User u  where id = ?1")
	String findCustomById(Long Id);



}
