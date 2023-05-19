package com.cos.blog.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.blog.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{

	Page<Board> findByTitleContainingOrContentContaining(String title, String content, Pageable pageable);
}
