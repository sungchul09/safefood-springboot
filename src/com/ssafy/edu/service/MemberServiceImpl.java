package com.ssafy.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.MemberDao;
import com.ssafy.edu.dto.MemberDto;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	@Transactional
	public void insertMember(MemberDto mem) {
		memberDao.insertMember(mem);
	}
	@Override
	@Transactional
	public MemberDto deleteMember(String email) {
		return memberDao.deleteMember(email);
	}
	@Override
	@Transactional
	public MemberDto findMemberByEmail(String email) {
		return memberDao.findMemberByEmail(email);
	}
	@Override
	@Transactional
	public MemberDto findMemberByName(String username) {
		return memberDao.findMemberByName(username);
	}
	@Override
	@Transactional
	public List<MemberDto> findAll() {
		return memberDao.findAll();
	}
	@Override
	@Transactional
	public void updateMember(MemberDto mem) {
		memberDao.updateMember(mem);
	}
	@Override
	@Transactional
	public MemberDto checkMember(MemberDto mem) {
		return memberDao.checkMember(mem);
	}
	@Override
	@Transactional
	public MemberDto searchpass(String email) {
		return memberDao.searchpass(email);
	}
}
