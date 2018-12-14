package com.messenger.repository;

import com.messenger.model.Message;

import java.util.List;

//import com.example.easynotes.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {

	
	//@Query("select u.username,m.subject,m.sent_at,m.updated_at from Message m inner join m.user u on u.id = m.sender_id")
//	@Query(
//			value="select u.username,m.subject,m.sent_at,m.updated_at from users u \n" + 
//					"inner join messages m on u.id = m.user_id",
//			nativeQuery=true)
	//List<Message>getAllMessages();
}
