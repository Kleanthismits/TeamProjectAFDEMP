package com.messenger.bootstrap;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.messenger.model.Message;
import com.messenger.model.User;
import com.messenger.repository.MessageRepository;
import com.messenger.repository.UserRepository;

@Component
public class DevBootstrap implements ApplicationListener<ContextRefreshedEvent>{

	private UserRepository userRepository;
	private MessageRepository messageRepository;
	
	
	public DevBootstrap(UserRepository userRepository, MessageRepository messageRepository) {
		this.userRepository = userRepository;
		this.messageRepository = messageRepository;
	}

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		initData();
		
	}

	private void initData() {
		User kleanthis = new User("Kleanthis","30071983","r1");
		Message ddd = new Message("Otimoit", "TextContent");
		kleanthis.getMessages().add(ddd);
		userRepository.save(kleanthis);
		messageRepository.save(ddd);
		
		User nikos = new User("Nikos","55555555","r2");
		Message xxx = new Message("Elapousai", "Yolo");
		nikos.getMessages().add(xxx);
		userRepository.save(nikos);
		messageRepository.save(xxx);
		
		User kostas = new User("Kostas","66666666","r3");
		Message yyy = new Message("Otinanai", "Variemai");
		
		kostas.getMessages().add(yyy);
		userRepository.save(kostas);
		messageRepository.save(yyy);
		Message nnn = new Message("Alloena", "Bootcamp");
		kostas.getMessages().add(nnn);
		messageRepository.save(nnn);
		userRepository.save(kostas);
	}
}
