package miniMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniMemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniMemberDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int check(String id, String pw) {
		String sql="select * from mini_member";
		int result=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				if(rs.getString("id").equals(id)){
					if(rs.getString("pw").equals(pw)) {
						result=1;
					}else {
						result=2;
					}
				}
				/*
				 * System.out.println("id : "+rs.getString("id"));
				 * System.out.println("pw : "+rs.getString("pw"));
				 * System.out.println("nickname : "+rs.getString("nickname"));
				 * System.out.println("====================");
				 */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int regChk(MiniMemberDTO dto) {
		int result=0;
		String sql="insert into mini_member values(?,?,?,0)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,dto.getId());
			ps.setString(2,dto.getPw());
			ps.setString(3,dto.getNickname());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MiniMemberDTO> memberList(){
		String sql="select * from mini_member";
		ArrayList<MiniMemberDTO> list=new ArrayList<MiniMemberDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MiniMemberDTO dto =new MiniMemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public MiniMemberDTO memberInfo(String id) {
		MiniMemberDTO dto=null;
		String sql="select * from mini_member where id="+"'"+id+"'";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto=new MiniMemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void delete(String id) {
		String sql="delete from mini_member where id="+"'"+id+"'";
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int userLikeyUp(String id,String num){
		int result=0;
		
		result=likeUpTable(id,num);
		try {
			if(result==1){
				System.out.println("userUp실행");
				String sql="update mini_board set likey=likey+1 where num="+num;
				ps=con.prepareStatement(sql);
				ps.executeUpdate();
				result=2;
			}else{
				System.out.println("userDown실행");int delete=0;
				delete=likeDownTable(id,num);
				if(delete==1){
					String sql="update mini_board set likey=likey-1 where num="+num;
					ps=con.prepareStatement(sql);
					ps.executeUpdate();
					result=3;
				}else {
					result=4;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	//이미 num 이있으면 유닠이라 안들어갈테고, 없으면 1 반환하겠지
	public int likeUpTable(String id,String num){
		int result=0;
		String sql="insert into userLikey values(?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			ps.setString(2, id+num+12345);

			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//있으면 삭제가 되서 1이, 없으면 안되겠지
	public int likeDownTable(String id,String num){
		int result=0;
		String sql="delete from userLikey where id=? and list=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id+num+12345);

			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	
	public void memberModify(MiniMemberDTO dto){
		String sql="update mini_member set pw=?,nickname=? where id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}








