package com.example.InsideOut.service;

import java.util.List;
import com.example.InsideOut.model.NoteBean;

public interface NoteService {

	// 쪽지 발송
	int sendNote(NoteBean note);

	// 사용자 쪽지 발송
	int usersendNote(NoteBean note);

	// note_no의 max값 구하기
	int getNoteno();

	// 수신된 쪽지 목록 조회
	List<NoteBean> getReceivedList(NoteBean noteParam);

	// 발신된 쪽지 목록 조회
	List<NoteBean> getSentList(NoteBean noteParam);

	// 쪽지 상세 정보 조회 (안씀)
	NoteBean getNoteDetail(String note_No);

	// 발신된 쪽지 상세 정보 조회
	NoteBean getSentNoteDetail(int cnt);

	// 수신된 쪽지 상세 정보 조회
	NoteBean getReceivedNoteDetail(int cnt);

	// 쪽지 삭제
	int deleteNoteById(int note_No);

	// 답장
	NoteBean notereply(int cnt);

	int insertReply(NoteBean note);
	

	// 쪽지를 읽은 상태로 표시
	void markNoteAsRead(String note_No);
	// 수신된 쪽지 개수 조회
	int getReceivedCount(String recv_Id);
	// 발신된 쪽지 개수 조회
	int getSentCount(String mem_No);
	// 읽지 않은 쪽지 개수 조회
	int getUnreadCount(String mem_No);

}
