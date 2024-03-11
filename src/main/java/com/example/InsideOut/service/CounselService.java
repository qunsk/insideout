package com.example.InsideOut.service;

import java.util.List;

import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselRecordBean;
import com.example.InsideOut.model.CounselTypeBean;

public interface CounselService {

	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception;

	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public List<CounselBookingBean> getDt(String staff_no, String confirm_dt) throws Exception;

	public String getBooking(String booking_time) throws Exception;

	public CounselBookingBean getCounsel(CounselBookingBean counselBookingBean) throws Exception;

	public int insertRecord(CounselRecordBean counselRecordBean) throws Exception;

//	public List<CounselRecordBean> getRecordList(CounselRecordBean counselRecordBean) throws Exception;

	public CounselRecordBean getDetail(String booking_no) throws Exception;

	public int updateRecord(CounselRecordBean counselRecordBean) throws Exception;

	public int recordDelete(String booking_no) throws Exception;

	public int getListCount() throws Exception;

	public List<CounselRecordBean> getRecordList(String staff_no) throws Exception;
}
