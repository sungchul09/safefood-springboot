package com.ssafy.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.dto.MsgDto;

@Repository
public class MsgDao {
	String ns = "com.ssafy.edu.msg.";

	@Autowired
	private SqlSession sqlSession;

	public List<MsgDto> getMsglist() throws Exception {
		return sqlSession.selectList(ns + "getMsglist");
	}

	public MsgDto getMsg(MsgDto msg) throws Exception {
		return sqlSession.selectOne(ns + "getMsg", msg);
	}
	
	public MsgDto searchMsgByCode(int msg_code) throws Exception {
		return sqlSession.selectOne(ns + "searchMsgByCode", msg_code);
	}

	public List<MsgDto> searchMsgBySend(String send_email) throws Exception {
		return sqlSession.selectList(ns + "searchMsgBySend", send_email);
	}
	
	public List<MsgDto> searchMsgByReceive(String receive_email) throws Exception {
		return sqlSession.selectList(ns + "searchMsgByReceive", receive_email);
	}
	
	public void deleteMsg(int msg_code) throws Exception {
		sqlSession.selectOne(ns + "deleteMsg", msg_code);
	}

	public void addMsg(MsgDto msg) throws Exception {
		System.out.println(msg.toString());
		System.out.println(msg.toString());
		System.out.println(msg.toString());
		System.out.println(msg.toString());
		sqlSession.selectOne(ns + "addMsg", msg);
	}

}
