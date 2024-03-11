package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.NoteDAO;
import com.example.InsideOut.model.NoteBean;


@Service
public class NoteServiceImpl implements NoteService{

	@Autowired
	private NoteDAO dao;
	
	
    // 받은 쪽지 목록
	@Override
	public List<NoteBean> getReceivedList(NoteBean noteParam) {
		// TODO Auto-generated method stub
		return dao.getReceivedList(noteParam);
	}

	// 보낸 쪽지 목록
	@Override
	public List<NoteBean> getSentList(NoteBean noteParam) {
		// TODO Auto-generated method stub
		return dao.getSentList(noteParam);
	}

	// 쪽지 작성 
	@Override
	public int sendNote(NoteBean note) {
		// TODO Auto-generated method stub
		return dao.sendNote(note);
	}
	
	@Override
	public int getNoteno() {
		// TODO Auto-generated method stub
		return dao.getNoteno();
	}
	
	// 사용자 쪽지 작성 
	@Override
	public int usersendNote(NoteBean note) {
		// TODO Auto-generated method stub
		return dao.usersendNote(note);
	}

	// 받은 쪽지 수 
	@Override
	public int getReceivedCount(String recv_id) {
		// TODO Auto-generated method stub
		return dao.getReceivedCount(recv_id);
	}

	// 보낸 쪽지 수 
	@Override
	public int getSentCount(String send_id) {
		// TODO Auto-generated method stub
		return dao.getSentCount(send_id);
	}

	// 안 읽은 쪽지 수 
	@Override
	public int getUnreadCount(String mem_No) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 쪽지 상세 정보 조회 (안씀)
	@Override
	public NoteBean getNoteDetail(String note_No) {
		// TODO Auto-generated method stub
		return null;
	}

	// 쪽지를 읽은 상태로 표시
	@Override
	public void markNoteAsRead(String note_No) {
		// TODO Auto-generated method stub
		
	}

	// 삭제
	@Override
	public int deleteNoteById(int note_No) {
		// TODO Auto-generated method stub
		return dao.deleteNoteById(note_No);
	}

	// 받은 쪽지 내용 조회 
	@Override
	public NoteBean getReceivedNoteDetail(int cnt) {
	    // TODO Auto-generated method stub
	    return dao.getReceivedNoteDetail(cnt);
	}

	// 보낸 쪽지 내용 조회
	@Override
	public NoteBean getSentNoteDetail(int cnt) {
		// TODO Auto-generated method stub
		return dao.getSentNoteDetail(cnt);
	}

	// 답장 
	@Override
	public NoteBean notereply(int cnt) {
		// TODO Auto-generated method stub
		return dao.notereply(cnt);
	}

	@Override
	public int insertReply(NoteBean note) {
		// TODO Auto-generated method stub
		return dao.insertReply(note);
	}
			
}
