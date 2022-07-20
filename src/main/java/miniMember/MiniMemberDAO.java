package miniMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class MiniMemberDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniMemberDAO() throws Exception {
		con = DBConnect.getConnection();
	}
	
	
	public int idCheck(MiniMemberDTO dto) {
		int result = 0;
		String sql = "select * from mini_member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int idCheck(String id) {
		int result = 0;
		String sql = "select * from mini_member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int nickCheck(MiniMemberDTO dto) {
		int result = 0;
		String sql = "select * from mini_member where nickname=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getNickname());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int nickCheck(String nickname) {
		int result = 0;
		String sql = "select * from mini_member where nickname=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nickname);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int register(MiniMemberDTO dto) {
		int result = 0, upload = 0;
		int idCheck = idCheck(dto);
		int nickCheck = nickCheck(dto);
		String sql = "insert into mini_member values(?, ?, ?)";
		
		if(idCheck != 0) {
			result = 1;
			// 이미 등록된 아이디
			return result;
		} else if (nickCheck != 0) {
			result = 2;
			// 이미 등록된 닉네임
			return result;
		} else {
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getId());
				ps.setString(2, dto.getPw());
				ps.setString(3, dto.getNickname());
				upload = ps.executeUpdate();
				
				if(upload == 0) {
					result = 3;
					// 업로드 실패
					return result;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}
	
	public int login(String id, String pw) {
		int result = 0;
		String sql = "select * from mini_member where id=? and pw=?";
		int idCheck = idCheck(id);
		
		if(idCheck == 0) {
			result = 3;
			// 해당하는 아이디가 없습니다
			return result;
		} else {
			
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pw);
				result = ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result == 0) {
				result = 2;
				// 비밀번호가 틀림
				return result;
			} else {
				return result;
			}
		}
	}
	
	public MiniMemberDTO memberInfo(String id) {
		MiniMemberDTO dto = new MiniMemberDTO();
		String sql = "select * from mini_member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(id);
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int modifyMember(String id, String pw, String nickname) {
		int result = 0;
		int nick = nickCheck(nickname);
		String sql = "update mini_member set pw=?, nickname=? where id=?";
		
		if(nick == 1) {
			result = 2;
			// 닉네임 중복
			return result;
		} else {
			
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, pw);
				ps.setString(2, nickname);
				ps.setString(3, id);
				result = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		// 0 이면 업데이트 실패
		// 1 성공
		return result;
	}
	
	public String getNickname(String id) {
		String nickname = "";
		String sql = "select nickname from mini_member where id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				nickname = rs.getString("nickname");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return nickname;
	}
}
