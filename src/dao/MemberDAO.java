package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;

public class MemberDAO {
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url, user, pw);
	}

	public String testSHA256(String str) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}

	// 회원가입
	public int insert_member(MemberDTO dto) {
		String sql = "insert into members values(member_seq.nextval,?,?,?,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getEmail());
			if (dto.getPw() == null) {
				pstat.setString(2, dto.getPw());
			} else {
				pstat.setString(2, testSHA256(dto.getPw()));
			}
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getNickname());
			pstat.setString(5, dto.getGender());
			pstat.setString(6, dto.getBirthday());

			pstat.setString(7, dto.getAge());
			pstat.setInt(8, dto.getType());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	private PreparedStatement getPstatForGetId(Connection con, String email) throws Exception {
		String sql = "select id from members where email =?  ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		return pstat;
	}

	// seq리턴
	public int getId(String email) {
		try (Connection con = this.getConnection();
				PreparedStatement pstat = getPstatForGetId(con, email);
				ResultSet re = pstat.executeQuery();) {
			if (re.next()) {
				int id = re.getInt("id");
				return id;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int check(String email) {
		String sql = "select * from members where email=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	public int loginCheck(String email, String pw) {
		String sql = "select * from members where email=? and pw=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, testSHA256(pw));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	private PreparedStatement getPstatForGetNickname(Connection con, String email) throws Exception {
		String sql = "select nickname from members where email = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, email);
		return pstat;
	}

	public String getNickname(String email) {
		try (Connection con = this.getConnection();
				PreparedStatement pstat = getPstatForGetNickname(con, email);
				ResultSet re = pstat.executeQuery();) {
			if (re.next()) {
				String nickname = re.getString(1);
				return nickname;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int pwReset(String email, String pw) {
		String sql = "update members set pw=? where email=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, testSHA256(pw));
			pstat.setString(2, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	public PreparedStatement forSelect_Member(Connection con, int seq) throws Exception {
		String sql = "select * from members where id= ? ";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		return pstat;
	}

	// 한명의 회원정보
	public List<MemberDTO> select_Member(int seq) {

		try (Connection con = this.getConnection();
				PreparedStatement pstat = this.forSelect_Member(con, seq);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getInt(1));
			dto.setEmail(rs.getString(2));
			dto.setPw(rs.getString(3));
			dto.setName(rs.getString(4));
			dto.setNickname(rs.getString(5));
			dto.setGender(rs.getString(6));
			dto.setBirthday(rs.getString(7));
			dto.setAge(rs.getString(8));
			dto.setType(rs.getInt(9));
			List<MemberDTO> list = new ArrayList<>();
			list.add(dto);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 패스워드변경
	public int pwUpdate(String pw, int seq) {
		String sql = "update members set pw = ? where id= ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, testSHA256(pw));
			pstat.setInt(2, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 마이페이지 수정하기
	public int mpUpdate(String nickname, String gender, int seq) {
		String sql = "update members set nickname = ? , gender = ? where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, nickname);
			pstat.setString(2, gender);
			pstat.setInt(3, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
