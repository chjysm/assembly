package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import controllers.AdminController;
import controllers.WinController;
import dto.VisitDTO;

public class VisitDAO extends TimerTask {
	public void run() {
		try {
			insertVisitCount();
			System.out.println("DB에 저장 성공~!");
			AdminController.visitCount = 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.60.22:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url, user, pw);
	}
	
	public int insertVisitCount() throws Exception{
		String sql = "insert into visit(visitCount) values(?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, AdminController.visitCount);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<VisitDTO> VisitChart() throws Exception{
		String sql = "select * from visit where visitCount>1";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);		
				ResultSet rs = pstat.executeQuery();
				){
			List<VisitDTO> result = new ArrayList<>();
			while(rs.next()) {
				String visitDate = rs.getString("visitDate");
				int visitCount = rs.getInt("visitCount");
				VisitDTO vdto = new VisitDTO(visitDate, visitCount);
				result.add(vdto);
				con.commit();
			}
			return result;
		}
	}

}



