package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import dto.McFinalDTO;
import dto.McdonaldDTO;


public class MenuDataDAO {
	private Connection ready() throws Exception{
		Context ctx = new InitialContext();
		Context compenv = (Context)ctx.lookup("java:/comp/env"); 
		DataSource ds = (DataSource)compenv.lookup("jdbc"); 
		Connection con = ds.getConnection();
		return con;
	}

	public int mcSaveDB(int num, String table_name) {
		System.setProperty("webdriver.chrome.driver","/WEB-INF/lib/chromedriver.exe");
		ChromeOptions opt = new ChromeOptions();
		opt.addArguments("--silent");
		opt.addArguments("--headless");
		WebDriver driver = new ChromeDriver(opt);

		driver.get("http://www.mcdonalds.co.kr/www/kor/menu/menu_list.do?cate_cd=" + num);
		WebElement result = driver.findElement(By.cssSelector("#container"));
		String menuResult = result.getAttribute("innerHTML");

		Pattern p = Pattern.compile("<li>\n.+\n.+<div class=\"thumb\"><img src=\"(.+?)\" alt=\"(.+?)\"></div>\n.+<p class=\"sbj\">(.+?)<span class=\"eng\">(.+?)</span></p>");
		Matcher m = p.matcher(menuResult);

		driver.close();

		int rst = 0;
		int i = 1;
		while(m.find()) {
			int randomPrice = (int)Math.floor((Math.random() * (90-10+1))+10) * 100; //10~90 사이 랜덤 수 * 100
			String imgAddr = "http://www.mcdonalds.co.kr"+m.group(1);
			String menuName = m.group(3);
			String menuNameEng = m.group(4);
			String sql = "insert into "+ table_name +" values(?, ?, ?, ?, ?)";
			try(
					Connection con = this.ready();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setInt(1, i++);
				pstat.setString(2, imgAddr);
				pstat.setString(3, menuName);
				pstat.setString(4, menuNameEng);
				pstat.setInt(5, randomPrice);
				rst = pstat.executeUpdate();
			}catch(Exception e) {e.printStackTrace(); rst=-1;}
		}
		return rst;
	}	

	public int mcUpdateDB(String table_name) {
		String sql = "delete from "+table_name;
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			int result = pstat.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public ArrayList<McdonaldDTO> getMcInfo(String table_name) {
		String sql = "select * from\r\n" + 
				"(select row_number() over(order by floor(DBMS_RANDOM.VALUE(1, 6)) desc) as rown, " + table_name + ".* from " + table_name + ")\r\n" + 
				"where rown between 1 and 6";
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			ArrayList<McdonaldDTO> lists = new ArrayList();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String imgAddr = rs.getString("imgAddr");
				String menuName = rs.getString("menuName");
				String menuNameEng = rs.getString("menuNameEng");
				int price = rs.getInt("price");
				McdonaldDTO dto = new McdonaldDTO(seq, imgAddr, menuName, menuNameEng, price);
				lists.add(dto);
			}
			return lists;
		}catch(Exception e) {e.printStackTrace(); return null;}
	}

	public String personalCode() {
		String[] ALPHA = new String[] {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"};
		String rN="";
		for(int i=0; i<8; i++){
			int randTnum = (int) Math.floor(Math.random()*ALPHA.length);
			rN += ALPHA[randTnum];
		}
		return rN;
	}

	public int insertGameCode(String code) {
		long time = System.currentTimeMillis();
		String sql = "insert into game (code, begin, today) values (?, ?, sysdate)";
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, code);
			pstat.setLong(2, time);
			int result = pstat.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	

	//테스트용
	public Connection ready1() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "kh";
			String password = "kh";
			Connection con = DriverManager.getConnection(url, user, password);
			return con;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int updateGameStuff(String val, String value, String code) {
		String sql = "update game set "+val+"=? where code=?";
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, value);
			pstat.setString(2, code);
			int result = pstat.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int updateEnd(String code) {
		long time = System.currentTimeMillis();
		String sql = "update game set end="+time+" where code=?";
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, code);
			int result = pstat.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public McFinalDTO selectMcFinal(String personalCode){
		String sql = "select * from game where code='"+personalCode+"'";
		try(
				Connection con = this.ready1();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				String code = rs.getString("code");
				String takeIOM = rs.getString("takeIOM");
				String takeIOY = rs.getString("takeIOY");
				String burgerNameM = rs.getString("burgerNameM");
				String burgerNameY = rs.getString("burgerNameY");
				String sideNameM = rs.getString("sideNameM");
				String sideNameY = rs.getString("sideNameY");
				String cafeNameM = rs.getString("cafeNameM");
				String cafeNameY = rs.getString("cafeNameY");
				String beverageNameM = rs.getString("beverageNameM");
				String beverageNameY = rs.getString("beverageNameY");
				String desertNameM = rs.getString("desertNameM");
				String desertNaemY = rs.getString("desertNaemY");
				long begin = rs.getLong("begin");
				long end = rs.getLong("end");
				Date today = rs.getDate("today");
				McFinalDTO dto = new McFinalDTO(code, takeIOM, takeIOY, burgerNameM, burgerNameY, sideNameM, sideNameY, cafeNameM, cafeNameY, beverageNameM, beverageNameY, desertNameM, desertNaemY, begin, end, today);
				return dto;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public McdonaldDTO joinquery(String table_name, String head_name, String code){
		String sql = "select * from "+table_name+", game where menuname="+head_name+" and code like '"+code+"'";
		try(
				Connection con = this.ready();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				int seq = rs.getInt("seq");
				String imgAddr = rs.getString("imgAddr");
				String menuName = rs.getString("menuName");
				String menuNameEng = rs.getString("menuNameEng");
				int price = rs.getInt("price");
				McdonaldDTO dto = new McdonaldDTO(seq, imgAddr, menuName, menuNameEng, price);
				return dto;
			}
		}catch(Exception e) {e.printStackTrace();}
		return null;
	}
}
