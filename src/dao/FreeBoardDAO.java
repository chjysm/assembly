package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dto.FreeBoardDTO;

public class FreeBoardDAO {
	private Connection getConnection()throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.60.24:1521:xe";
		String user = "kh";
		String pw = "kh";

		return DriverManager.getConnection(url, user, pw);
	}

	public int insert(FreeBoardDTO param)throws Exception{ // 내용 등록
		String sql = "insert into FreeBoard values(FreeBoard_seq.nextval,?,?,?,0,?,default,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql); 
				){
			pstat.setString(1, param.getTitle());
			pstat.setString(2, param.getContent());
			pstat.setString(3, param.getWriter());
			pstat.setString(4, param.getIp());
			pstat.setString(5, param.getEmail());
			pstat.setInt(6, param.getId());
			con.commit();
			int result = pstat.executeUpdate();
			return result;

		}
	}

	public List<FreeBoardDTO> FreeList()throws Exception{ // 자유게시판 글 목록
		String sql = "select * from FreeBoard order by seq desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<FreeBoardDTO> freeList = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				int viewCount =rs.getInt("viewCount");
				String ip = rs.getString("ip");
				Timestamp writeDate = rs.getTimestamp("writeDate");
				String email = rs.getString("email");
				int id = rs.getInt("id");
				FreeBoardDTO dto = new FreeBoardDTO(seq,title,content,writer,viewCount,ip,writeDate,id,email);
				freeList.add(dto);

			}
			return freeList;
		}	
	}
	public int viewCount(int seq)throws Exception{ // 조회수 올리기
		String sql = "update FreeBoard set viewCount = viewCount + 1 where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			con.commit();
			int result = pstat.executeUpdate();
			return result;
		}
	}
	private PreparedStatement pstatContent(Connection con, int seq)throws Exception{
		String sql = "select * from FreeBoard where seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		return pstat;}
	public FreeBoardDTO content(int seq)throws Exception { // 선택한 글 내용 불러오기
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = this.pstatContent(con, seq);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				seq = rs.getInt("seq");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				int viewCount = rs.getInt("viewCount");
				String ip = rs.getString("ip");
				Timestamp writeDate = rs.getTimestamp("writeDate");
				String email = rs.getString("email");
				int id = rs.getInt("id");
				FreeBoardDTO dto = new FreeBoardDTO(seq, title, content, writer, viewCount ,ip, writeDate, id, email);
				return dto;
			}
			return null;
			
		}
	}

	public int deleteContent(int seq) throws Exception{ // 글 삭제
		String sql = "delete from FreeBoard where seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			return pstat.executeUpdate();
		}
	}

}
