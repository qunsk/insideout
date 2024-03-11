package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.BoardDao;
import com.example.InsideOut.model.BoardBean;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;

	// 첨부파일 없는 게시판 저장
	public void insertBoard(BoardBean b) throws Exception {
		boardDao.insertBoard(b);
	}

	// 첨부파일 저장
	public void insertFile(BoardBean board) throws Exception {
		boardDao.insertFile(board);

	}

	// 첨부파일 있는 게시판 저장

	public void insertFileboard(BoardBean board) throws Exception {
		boardDao.insertFileboard(board);
	}

	// 게시글 갯수
	public int getNoticeCount() throws Exception {
		return boardDao.getNoticeCount();
	}

	public int getJobCount() throws Exception {
		return boardDao.getJobCount();
	}

	public int getQnACount() throws Exception {
		return boardDao.getQnACount();
	}

	// 공지게시판 목록

	public List getNoticeList(int page) throws Exception {
		return boardDao.getNoticeList(page);
	}

	public List getJobList(int page) throws Exception {
		return boardDao.getJobList(page);
	}

	public List getQnAList(int page) throws Exception {
		return boardDao.getQnAList(page);
	}

	// 조회수 증가
	public void hit(int post_no) throws Exception {
		boardDao.boardHit(post_no);
	}

	// 상세정보
	public BoardBean board_cont(int post_no) throws Exception {

		BoardBean board = boardDao.getBoardCont(post_no);

		return board;
	}

	// 게시글 수정
	public void edit(BoardBean b) throws Exception {
		boardDao.boardEdit(b);

	}

	// 게시글 수정
	public void editFile(BoardBean board) throws Exception {
		boardDao.editFile(board);
	}

	public void edit_fileBoard(BoardBean board) throws Exception {
		boardDao.editFileBoard(board);

	}

	// 게시글 삭제
	public void del_ok(int post_no) throws Exception {
		boardDao.boardDelete(post_no);
	}

	// 1:1 문의 게시판 관리자용 리스트
	public List<BoardBean> getAskBoardList() throws Exception {
		return boardDao.getAskBoardList();
	}

	// 1:1 문의게시판 - 상세페이지
	public BoardBean getAskView(int post_no) {
		return boardDao.getAskView(post_no);
	}

	// 1:1 문의게시판 -
	public BoardBean getReplyAsk(int post_no) {
		return boardDao.getReplyAsk(post_no);
	}

	// 1:1 문의게시판 - 문의 삭제
	public void deleteAskView(int post_no) {
		boardDao.deleteAskView(post_no);
	}

	// 1:1 문의게시판 -
	public void askViewReply(BoardBean BoardBean) {
		boardDao.askViewReply(BoardBean);

	}

	// 1:1 문의글 쓰기- 작성자 받아오기
	public String getStudentName(String name) {
		return boardDao.getStudentName(name);
	}

	// 1:1 문의글 쓰기- 작성자 받아오기
	public String getStaffName(String name) {
		return boardDao.getStaffName(name);
	}

	// 1:1 문의글 쓰기- 작성글 저장
	public void askWrite(BoardBean board) {
		boardDao.askWrite(board);
	}

	// 1:1 문의 게시판리스트
	public List<BoardBean> getAskList(String writer) throws Exception {
		return boardDao.getAskList(writer);
	}

}
