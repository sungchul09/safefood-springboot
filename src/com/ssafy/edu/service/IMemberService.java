package com.ssafy.edu.service;

import java.util.List;

import com.ssafy.edu.dto.MemberDto;


public interface IMemberService {
	void insertMember(MemberDto mem);
	void updateMember(MemberDto mem);
	
	MemberDto findMemberByEmail(String email);
	MemberDto findMemberByName(String name);
	List<MemberDto> findAll();
	MemberDto deleteMember(String email);
	MemberDto checkMember(MemberDto mem);
	MemberDto searchpass(String email);
}
