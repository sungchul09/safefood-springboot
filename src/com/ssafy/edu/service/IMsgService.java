package com.ssafy.edu.service;

import java.util.List;

import com.ssafy.edu.dto.MsgDto;

public interface IMsgService {
	//public void addFood(FoodDto food) throws Exception;


	public List<MsgDto> getMsglist() throws Exception ;

	
	public MsgDto getMsg(MsgDto msg) throws Exception ;
	
	
	public MsgDto searchMsgByCode(int msg_code) throws Exception ;
	

	public List<MsgDto> searchMsgBySend(String send_email) throws Exception ;
	
	
	public List<MsgDto> searchMsgByReceive(String receive_email) throws Exception;
	
	
	public void deleteMsg(int msg_code) throws Exception ;
	

	public void addMsg(MsgDto msg) throws Exception ;
	

}
