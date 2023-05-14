package com.cos.blog.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

//사용자 요청 -> 응답(data)
@RestController
public class HttpControllerTest {
	
	private static final String TAG = "HttpControllerTest";
	
	@GetMapping("/http/lombok")
	public String lombokTest() {
		
		Member m = new Member(1, "ssar", "1234", "email");
		System.out.println(TAG+"getter: "+m.getId());
		m.setId(5000);
		System.out.println(TAG+"getter: "+m.getId());
		
		return "lombok test 완료";
	}

}
