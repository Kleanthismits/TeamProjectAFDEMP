package com.messenger.repository;


import com.messenger.model.User;

import java.util.List;

//import com.example.easynotes.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;



@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	@Query("from User order by username")
	List<User>findByNameSorted();
	
	@Query("from User where username = ?1")
	User findByUsername(String username);


}
