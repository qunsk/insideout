package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.CounselDao;
import com.example.InsideOut.model.CounselBookingBean;
import com.example.InsideOut.model.CounselRecordBean;
import com.example.InsideOut.model.CounselTypeBean;

@Service
public class CounselServiceImpl implements CounselService {
	
	@Autowired
	private CounselDao counselDao;
	
	@Override
	public CounselTypeBean getCounselType(String counsel_typeno) throws Exception {
		// TODO Auto-generated method stub
		CounselTypeBean counselTypeBean = counselDao.getCounselType(counsel_typeno);
		return counselTypeBean;
	}

	@Override
	public int insertCounsel(CounselBookingBean counselBookingBean) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.insertCounsel(counselBookingBean);
	}

	@Override
	public List<CounselBookingBean> getDt(String staff_no, String booking_dt) throws Exception {		
		return counselDao.getDt(staff_no, booking_dt);
	}

	@Override
	public String getBooking(String booking_time) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.getBooking(booking_time);
	}

	@Override
	public CounselBookingBean getCounsel(CounselBookingBean counselBookingBean) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.getCounsel(counselBookingBean);
	}

	@Override
	public int insertRecord(CounselRecordBean counselRecordBean) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.insertRecord(counselRecordBean);
	}

//	@Override
//	public List<CounselRecordBean> getRecordList(CounselRecordBean counselRecordBean) throws Exception {
//		// TODO Auto-generated method stub
//		return counselDao.getRecordList(counselRecordBean);
//	}

	@Override
	public CounselRecordBean getDetail(String booking_no) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.getDetail(booking_no);
	}

	@Override
	public int updateRecord(CounselRecordBean counselRecordBean) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.updateRecord(counselRecordBean);
	}

	@Override
	public int recordDelete(String booking_no) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.recordDelete(booking_no);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return counselDao.getListCount();
	}

	@Override
	public List<CounselRecordBean> getRecordList(String staff_no) throws Exception {
		// TODO Auto-generated method stub
		return counselDao.getRecordList(staff_no);
	}	
}
