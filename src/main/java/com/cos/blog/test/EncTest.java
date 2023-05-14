package com.cos.blog.test;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ch.qos.logback.core.pattern.color.BoldCyanCompositeConverter;

public class EncTest {
	
	@Test
	public void 암호화() {
		String encPassword = new BCryptPasswordEncoder().encode("1234");
		System.out.println("1234 해쉬: "+ encPassword);
	}

}
