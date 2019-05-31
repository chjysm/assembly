package dto;

import java.sql.Timestamp;

public class FreeCommentsDTO {
	private int seq;
	private String comment;
	private int postNum;
	private String postTitle;
	private String writer;
	private String ip;
	private Timestamp writeDate;
	private String email;
	private int id;
	public FreeCommentsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeCommentsDTO(int seq, String comment, int postNum, String postTitle, String writer, String ip,
			Timestamp writeDate, String email, int id) {
		super();
		this.seq = seq;
		this.comment = comment;
		this.postNum = postNum;
		this.postTitle = postTitle;
		this.writer = writer;
		this.ip = ip;
		this.writeDate = writeDate;
		this.email = email;
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}