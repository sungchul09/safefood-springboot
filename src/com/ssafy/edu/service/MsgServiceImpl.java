package com.ssafy.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.dao.MsgDao;
import com.ssafy.edu.dto.MsgDto;

@Service
public class MsgServiceImpl implements IMsgService {
	@Autowired
	MsgDao msgDao;

	@Override
	@Transactional(readOnly = true)
	public List<MsgDto> getMsglist() throws Exception {
		return msgDao.getMsglist();
	}

	@Override
	@Transactional(readOnly = true)
	public MsgDto getMsg(MsgDto Msg) throws Exception {
		return msgDao.getMsg(Msg);
	}

	@Override
	@Transactional(readOnly = true)
	public MsgDto searchMsgByCode(int msg_code) throws Exception {
		return msgDao.searchMsgByCode(msg_code);
	}

	@Override
	@Transactional
	public void deleteMsg(int msg_code) throws Exception {
		msgDao.deleteMsg(msg_code);
	}


	@Override
	@Transactional
	public void addMsg(MsgDto Msg) throws Exception {
		msgDao.addMsg(Msg);
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<MsgDto> searchMsgBySend(String send_email) throws Exception {
		return msgDao.searchMsgBySend(send_email);
	}

	@Override
	@Transactional(readOnly = true)
	public List<MsgDto> searchMsgByReceive(String receive_email) throws Exception {
		return msgDao.searchMsgByReceive(receive_email);
	}
}
