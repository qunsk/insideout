package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.BoardBean;

@Mapper
public interface BoardDao {

	public void insertBoard(BoardBean b) throws Exception;

	public void insertFile(BoardBean board) throws Exception;

	public void insertFileboard(BoardBean board) throws Exception;

	public List<BoardBean> getNoticeList(int page) throws Exception;

	public List<BoardBean> getJobList(int page) throws Exception;

	public List<BoardBean> getQnAList(int page) throws Exception;

	public int getNoticeCount() throws Exception;

	public int getJobCount() throws Exception;

	public int getQnACount() throws Exception;

	public BoardBean getBoardCont(int post_no) throws Exception;

	public void boardHit(int post_no) throws Exception;

	public void boardEdit(BoardBean b) throws Exception;

	public void editFile(BoardBean board) throws Exception;

	public void editFileBoard(BoardBean b) throws Exception;

	public void boardDelete(int post_no) throws Exception;

	public List<BoardBean> getAskBoardList();

	public List<BoardBean> getAskList(String writer);

	public BoardBean getAskView(int post_no);

	public void deleteAskView(int post_no);

	public BoardBean getReplyAsk(int post_no);

	public void askViewReply(BoardBean postBean);

	public String getStudentName(String name);

	public String getStaffName(String name);

	public void askWrite(BoardBean board);

}