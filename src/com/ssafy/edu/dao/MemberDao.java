package com.ssafy.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dto.MemberDto;
import com.ssafy.edu.service.IMemberService;

@Repository
public class MemberDao {
	
	String ns ="com.ssafy.edu.member.";

	@Autowired
	private SqlSession sqlsession;

	public void insertMember(MemberDto mem) {
		sqlsession.insert(ns+"insertMember",mem);
	}

	public MemberDto deleteMember(String email) {
		return sqlsession.selectOne(ns+"deleteMember",email);
	}

	public MemberDto findMemberByEmail(String email) {
		return sqlsession.selectOne(ns+"findMemberByEmail",email);
	}

	public List<MemberDto> findAll() {
		return sqlsession.selectList(ns+"findAll");
	}

	public void updateMember(MemberDto mem) {
		sqlsession.update(ns+"updateMember",mem);
	}

	public MemberDto findMemberByName(String username) {
		return sqlsession.selectOne(ns+"findMemberByName",username);
	}

	public MemberDto checkMember(MemberDto mem) {
		return sqlsession.selectOne(ns+"checkMember",mem);
	}
	
	public MemberDto searchpass(String email) {
		return sqlsession.selectOne(ns+"findMemberByEmail",email);
	}


}
