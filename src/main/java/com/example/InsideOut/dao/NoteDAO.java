package com.example.InsideOut.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.InsideOut.model.NoteBean;

@Mapper
public interface NoteDAO {

	// 쪽지 보내기
	int sendNote(NoteBean note);

	int getNoteno();

	int usersendNote(NoteBean note);

	// 받은 쪽지 리스트
	List<NoteBean> getReceivedList(NoteBean noteParam);

	// 보낸 쪽지 리스트
	List<NoteBean> getSentList(NoteBean noteParam);

	// 받은 쪽지 카운트
	int getReceivedCount(String recv_id);

	// 보낸 쪽지 카운트
	int getSentCount(String send_id);

	// 보낸 쪽지 내용 보기
	NoteBean getSentNoteDetail(int cnt);

	// 받은 쪽지 내용 보기
	NoteBean getReceivedNoteDetail(int cnt);

	// 삭제
	int deleteNoteById(int note_No);

	// 답장
	NoteBean notereply(int cnt);

	int insertReply(NoteBean note);

	// 읽은 쪽지 표시
	void markNoteAsRead(String note_No);

}
