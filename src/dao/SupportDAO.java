package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.SupportDTO;

public class SupportDAO {
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.60.22:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url, user, pw);
	}
	public int insert(SupportDTO param) throws Exception { // 내용 등록
		String sql = "insert into supportboard values(Support_seq.nextval,?,?,?,default,default,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, param.getEmail());
			pstat.setInt(2, param.getId());
			pstat.setString(3, param.getName());
			pstat.setInt(4, param.getAmount());
			con.commit();
			int result = pstat.executeUpdate();
			return result;
		}
	}
	public int getMax()throws Exception {
		String sql = "select sum(amount) sum from supportboard";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet re= pstat.executeQuery();) {
			if(re.next()) {
				int result=re.getInt("sum");
				return result;
			}else {
				return -1;
			}
		} 
	}
}
