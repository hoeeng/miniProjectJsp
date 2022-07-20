package miniMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniMemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniMemberDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MiniMemberDTO> getMember() {
		String sql="select * from mini_member";
		ArrayList<MiniMemberDTO> list = new ArrayList<MiniMemberDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MiniMemberDTO dto = new MiniMemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public void update(MiniMemberDTO dto) {
		String sql ="update mini_member set pw=?, nickname=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getId());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void delete(String id) {
		String sql="delete from mini_member where id='"+id+"'";
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public MiniMemberDTO getU(String id) {
		MiniMemberDTO dto = null;
		String sql="select * from mini_member where id='"+id+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MiniMemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
		
	}
	
	public int userChk(String id, String pw) {
		String sql="select * from mini_member where id=?";
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				//아이디 존재
				if(pw.equals(rs.getString("pw"))) {
					//아이디 일치 로그인 성공
					result=1;
				}else {
					//비밀번호 틀림
					result=0;
				}
			}else {
				//아이디 없음
				result=-1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int insert(MiniMemberDTO dto) {
		String sql="insert into mini_member values(?,?,?)";
		int result =0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getNickname());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
