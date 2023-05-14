package com.cos.blog.test;

import java.util.List;
import java.util.function.Supplier;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;

// html파일이 아니라 data를 리턴해주는 controller=RestController
@RestController
public class DummyControllerTest {
	
	@Autowired //의존성 주입
	private UserRepository userRepository;
	
	// save 함수는 id를 전달하지 않으면 insert를 해주고
	// 				id에 대한 데이터가 있으면 update 를 해준다.
	//				id에 대한 데이터가 없으면 insert를 해준다.
	// 이메일, password
	@Transactional
	@PutMapping("/dummy/user/{id}")
	public User updateUser(@PathVariable int id, @RequestBody User requestUser) { //json 데이터를 요청 > JAVA Object(MessageConverter의 Jackson라이브러리가 변환해서 받아준다. 그게 RequestBody)
		System.out.println("id: "+id);
		System.out.println("password: "+requestUser.getPassword());
		System.out.println("email: "+requestUser.getEmail());
		
		User user = userRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("수정에 실패하였습니다.");
			
		});
		user.setPassword(requestUser.getPassword());
		user.setEmail(requestUser.getEmail());
	//	userRepository.save(user); 
		// 더티 체킹
		return null;
	}
	
	@DeleteMapping("/dummy/user/{id}")
	public String delete(@PathVariable int id) {
		try {
			userRepository.deleteById(id);
			
		} catch (Exception e){
			return "삭제를 실패하였습니다. 해당 id는 DB에 없습니다.";
		}
		return "삭제되었습니다. id"+id;
	}
	
	// localhost:8000/blog/dummy/user
	@GetMapping("/dummy/user")
	public List<User> list() {
		return userRepository.findAll();
	}
	
	//{id} 주소로 parameter를 전달 받을 수 있다.
	// localhost:8000/blog/dummy/user/3
	@GetMapping("/dummy/user/{id}")
	public User detail(@PathVariable int id) {
		// user/4을 찾으면 내가 데이터베이스에서 못찾아오게 되면 user가 null이 될 것 아니?
		// 그럼 return이 null이 되잖아. 그러면 프로그램에 문제가 있지 않겠니?
		// Optional로 너의 User객체를 감싸서 가져올테니 null인지 아닌지 판단해서 return해!
		
		User user = userRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
		@Override
		public IllegalArgumentException get() {
			// TODO Auto-generated method stub
			return new IllegalArgumentException("해당 유저는 없습니다. id: "+id);
		}
		});
		// Web browser에게 자바 객체를 return 해줌
		// 요청 : Web browser
		// user 객체 = 자바 오브젝트
		// 변환 (웹브라우저가 이해할 수 있는 데이터) -> json (Gson 라이브러리)
		// 스프링부트 = MessageConverter라는 애가 응답시에 자동 작동
		// 만약에 자바 오브젝트를 return 하게되면 MessageConverter가 Jackson 라이브러리를 호출해서
		// user 오브젝트를 json으로 변환해서 브라우저에 반환함.
		return user;
	}
	
	
	// http://localhost:800/blog/dummy/join (요청)
	// http의 body에 suer
	@PostMapping("/dummy/join")
	public String join(User user) { // key=value 형태의 데이터를 받아줌
		System.out.println("userid: "+user.getId());
		System.out.println("username: "+user.getUsername());
		System.out.println("password: "+user.getPassword());
		System.out.println("email: "+user.getEmail());
		System.out.println("role: "+user.getRole());
		System.out.println("createDate: "+user.getCreateDate());
	
		user.setRole(RoleType.USER);
		userRepository.save(user);
		
		return "회원가입을 완료하였습니다.";
	}
	
}
