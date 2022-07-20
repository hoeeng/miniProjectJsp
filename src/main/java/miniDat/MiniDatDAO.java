package miniDat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniDatDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniDatDAO() throws Exception{
		con = DBConnect.getConnection();
	}
	
	public MiniDatDTO getDat() {
		MiniDatDTO dto = new MiniDatDTO();
		
		try {
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			dto.setNickname(rs.getString("nickname"));
			dto.setNum(rs.getInt("num"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setDatnum(rs.getInt("datnum"));
			dto.setLikey(rs.getInt("likey"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<MiniDatDTO> getDatList(int num) {
		ArrayList<MiniDatDTO> list = new ArrayList<>();
		String sql = "select * from mini_dat where num=? order by savedate asc";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(getDat());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int insertDat(MiniDatDTO dto) {
		int result = 0;
		String sql = "insert into mini_dat values(?,mini_dat_seq.nextval,?,?,sysdate,?,0)";
										//num(댓글이 달린 게시글번호),댓글고유번호, id, nickname, //, content, likey
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getNickname());
			ps.setString(4, dto.getContent());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteDat(int datnum) {
		int result = 0;
		String sql = "delete from mini_dat where datnum=?";

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			result = ps.executeUpdate();
		} catch (Exception e) {
			
		}
		
		return result;
	}
	
	public int getBoardDatCount(int num) {
		int result = 0;
		String sql = "select count(*) from mini_dat where num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getDatCount(String id) {
		int result = 0;
		String sql = "select count(*) from mini_dat where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
