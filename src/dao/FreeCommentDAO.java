package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import dto.FreeCommentsDTO;



public class FreeCommentDAO {
	private Connection getConnection()throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.60.24:1521:xe";
		String user = "kh";
		String pw = "kh";

		return DriverManager.getConnection(url, user, pw);
	}
	
	public int insertComment(FreeCommentsDTO param)throws Exception{ // 댓글 정보 데베에 저장
		String sql = "insert into FreeComments values(freeComments_seq.nextval,?,?,?,?,?,default,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, param.getComment());
			pstat.setInt(2, param.getPostNum());
			pstat.setString(3, param.getPostTitle());
			pstat.setString(4, param.getWriter());
			pstat.setString(5, param.getIp());
			pstat.setString(6, param.getEmail());
			pstat.setInt(7, param.getId());
			con.commit();
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
