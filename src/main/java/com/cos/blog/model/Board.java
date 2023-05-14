package com.cos.blog.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable=false, length = 100)
	private String title;
	
	@Lob // 대용량 데이터 사용시 사용하는 어노테이션
	private String content; //섬머노트 라이브러리 <html>태그가 섞여서 디자인이 됨.
	
	private int count; //조회수

	@ManyToOne // Many = Board, User = One 한명의 유저는 여러개의 글을 쓸 수 있음
	@JoinColumn(name="userId")
	private User user; //DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장활 수 있다.
						// 자바에서 데이터베이스 자료형에 맞춰서 테이블 작성해야 함
						// private int userId; 로 작성해야 하는데 오브젝트를 그대로 사용할 수 있음
	
	@OneToMany(mappedBy = "board", fetch=FetchType.EAGER) //mappedBy 연관관계의 주인이 아니다(난 FK가 아니다)
	@JsonIgnoreProperties({"board"})
	@OrderBy("id desc")
	private List<Reply> replys;
	
	@CreationTimestamp
	private Timestamp creatDate;

}
