package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselRecordBean;
import com.example.InsideOut.model.CounselTypeBean;

@Mapper
public interface CounselDao {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public List<CounselBookingBean> getDt(String staff_no, String booking_dt) throws Exception;

	public String getBooking(String booking_time) throws Exception;

	public CounselBookingBean getCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public int insertRecord(CounselRecordBean counselRecordBean) throws Exception;


	public CounselRecordBean getDetail(String booking_no) throws Exception;

	public int updateRecord(CounselRecordBean counselRecordBean) throws Exception;

	public int recordDelete(String booking_no) throws Exception;

	public int getListCount() throws Exception;

	public List<CounselRecordBean> getRecordList(String staff_no);


}
