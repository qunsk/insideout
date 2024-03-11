package com.example.InsideOut.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.MemberDao;
import com.example.InsideOut.dao.UserRepository;
import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.NameBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Value("${phone_key_1}")
	private String phonekey1;

	@Value("${phone_key_2}")
	private String phonekey2;
	
	@Value("${myphone}")
	private String myphone; 

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public void stuInsert(StudentBean stu) {
		memberDao.stuInsert(stu);
	}

	@Override
	public void staInsert(StaffBean sta) {
		memberDao.staInsert(sta);
	}

	@Override
	public void memInsert(MemberBean member) {
		memberDao.memInsert(member);
	}

	@Override
	public void deptInsert(DeptBean dept) {
		memberDao.deptInsert(dept);
	}
	
	@Override
	public void advisor(DeptBean dept) {
		memberDao.advisor(dept);
	}

	// id 중복검사
	public int usernameCheck(String username){
		int result = 0;
		MemberBean member = userRepository.findByUsername(username);
		if (member != null)
			result = 1; // 중복 ID
		return result;
	}
	
	public void phoneNumber(String phone, int randomNum) {
		String api_key = phonekey1;
		String api_secret = phonekey2;
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", myphone); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[InsideOut] 인증번호는" + "[" + randomNum + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	public String getUserRole(String username) {
		return memberDao.getUserRole(username);
	}
	
	public int getName(NameBean name) {
		return memberDao.getName(name);
	}

	public int updatePass(LoginRequestDto user) {
		return memberDao.updatePass(user);
	}

	
	
}
