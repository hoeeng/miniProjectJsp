package miniDat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniDatDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniDatDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(MiniDatDTO dto) {
		String sql="update mini_dat set content=? where num=?";
		try {
			System.out.println(dto.getContent());
			System.out.println(dto.getNum());
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setInt(2, dto.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void delete(int num) {
		String sql="delete from mini_dat where num="+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public MiniDatDTO getContent(int num) {
		String sql="select * from mini_dat where boardnum="+num;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getDat();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<MiniDatDTO> list(int num) {
		String sql="select * from mini_dat where boardnum=?";
		ArrayList<MiniDatDTO> list = new ArrayList<MiniDatDTO>();
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
	
	public void create(String id, String nickname, String content, int num) {
		String sql="insert into mini_dat(num, id, nickname, content, boardnum) "
				+ "values(mini_dat_seq.nextval,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, nickname);
			ps.setString(3, content);
			ps.setInt(4, num);
			// System.out.println("댓글등록완료");
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private MiniDatDTO getDat() {
		MiniDatDTO dto = new MiniDatDTO();
		try {
			dto.setId(rs.getString("id"));
			dto.setNickname(rs.getString("nickname"));
			dto.setContent(rs.getString("content"));
			dto.setNum(rs.getInt("num"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setBoardnum(rs.getInt("boardnum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
