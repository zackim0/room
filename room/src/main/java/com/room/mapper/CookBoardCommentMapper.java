package com.room.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.room.dto.CKBoard;
import com.room.dto.CKBoardAttach;
import com.room.dto.CKBoardComment;

@Mapper
public interface CookBoardCommentMapper {

	void insertBoardComment(CKBoardComment boardComment);
	List<CKBoardComment> selectByBoardNo(int boardNo);
	List<CKBoardComment> selectRangeByBoardNo(@Param("boardNo")int boardNo, @Param("from")int from, @Param("count")int count);
	int selectCommentCount();
	void delete(int commentNo);
	void update(CKBoardComment boardComment);
	
	CKBoardComment selectByCommentNo(int commentNo);
	void insertBoardReComment(CKBoardComment boardComment);
	void updateGroupNo(CKBoardComment comment);
	void updateStep(@Param("groupNo") int groupNo, @Param("step") int step);

}
