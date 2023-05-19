package com.cos.blog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor //빈 생성자
@AllArgsConstructor // 전체 생성자
@Builder // builder 패턴
@Entity //User 클래스가 자동으로 MariaDB에 테이블이 생성된다.
//@DynamicInsert // insert시에 null인 필드를 제외시켜줌
public class User {
	
	@Id //PK
	@GeneratedValue(strategy= GenerationType.IDENTITY) //프로젝트에서 연결된 DB의 넘버링을 따라간다.
	private int id;
	
	@Column(nullable=false, length=30)
	private String username;
	
	@Column(nullable=false, length=100)
	private String password;
	
	@Column(nullable=false, length=50)
	private String email;
	
//	@ColumnDefault("'user'")
	@Enumerated(EnumType.STRING)
	private RoleType role;
	
	@CreationTimestamp // 시간이 자동입력
	private Timestamp createDate;

}
