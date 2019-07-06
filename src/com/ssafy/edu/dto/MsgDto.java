package com.ssafy.edu.dto;

public class MsgDto {

		/** msg code*/
		protected int msg_code;
		/** 보내는 사람 email */
		protected String send_email;
		/** 받는 사람 email */
		protected String receive_email;
		/** 메세지 내용 */
		protected String contents;
		/** 보낸 일자*/
		protected String send_date;
		public MsgDto() {
			super();
			// TODO Auto-generated constructor stub
		}
		public MsgDto(String send_email, String receive_email, String contents, String send_date) {
			super();
			this.send_email = send_email;
			this.receive_email = receive_email;
			this.contents = contents;
			this.send_date = send_date;
		}
		
		public MsgDto(int msg_code, String send_email, String receive_email, String contents, String send_date) {
			super();
			this.msg_code = msg_code;
			this.send_email = send_email;
			this.receive_email = receive_email;
			this.contents = contents;
			this.send_date = send_date;
		}
		public String getSend_email() {
			return send_email;
		}
		public void setSend_email(String send_email) {
			this.send_email = send_email;
		}
		public String getReceive_email() {
			return receive_email;
		}
		public void setReceive_email(String receive_email) {
			this.receive_email = receive_email;
		}
		public String getContents() {
			return contents;
		}
		public void setContents(String contents) {
			this.contents = contents;
		}
		public String getSend_date() {
			return send_date;
		}
		public void setSend_date(String send_date) {
			this.send_date = send_date;
		}
		public int getMsg_code() {
			return msg_code;
		}
		public void setMsg_code(int msg_code) {
			this.msg_code = msg_code;
		}
		@Override
		public String toString() {
			return "MsgDto [msg_code=" + msg_code + ", send_email=" + send_email + ", receive_email=" + receive_email
					+ ", contents=" + contents + ", send_date=" + send_date + "]";
		}


}
