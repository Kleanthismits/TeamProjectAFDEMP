package com.messenger.repository;

import com.messenger.model.Message;

import java.util.List;

//import com.example.easynotes.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
	
    @Query("from Message order by id")
    List<Message> findAllUserMessages();
    
    @Query("from Message where sender_id=?1")
    List<Message> findSentMessages(Long sender_id);
    
    @Query("from Message where receiver_id=?1")
    List<Message> findReceivedMessages(Long receiver_id);
    
	@Query("from Message")
	List<Message>getAllMessages();
	
	//change
    @Query("from Message where sender_id=?1 and sender_view=0")
    List<Message> findSentMessagesR1R2(Long sender_id);
    
    //change
    @Query("from Message where receiver_id=?1 and sender_view=0")
    List<Message> findReceivedMessagesR1R2(Long receiver_id);
}
