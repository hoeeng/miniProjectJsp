package miniLikey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBConnect;

public class MiniLikeyDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniLikeyDAO() throws Exception {
		con = DBConnect.getConnection();
	}
	
	
	public int boardLikePlus(int num) {
		int result = 0;
		String sql = "update mini_board set likey=likey+1 where num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardLikeUp(int num, String id) {
		int result = 0;
		String sql = "insert into mini_likey(num, id) values(?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			result = ps.executeUpdate();
			
			if(result == 1) {
				boardLikePlus(num);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	
	public int boardLikeMinus(int num) {
		int result = 0;
		String sql = "update mini_board set likey=likey-1 where num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardLikeDown(int num, String id) {
		int result = 0;
		String sql = "delete from mini_likey where num=? and id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			result = ps.executeUpdate();
			
			if(result == 1) {
				boardLikeMinus(num);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public int datLikePlus(int datnum) {
		int result = 0;
		String sql = "update mini_dat set likey=likey+1 where datnum=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int datLikeUp(int datnum, String id) {
		int result = 0;
		String sql = "insert into mini_likey(datnum, id) values(?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			ps.setString(2, id);
			result = ps.executeUpdate();
			
			if(result == 1) {
				datLikePlus(datnum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	public int datLikeMinus(int datnum) {
		int result = 0;
		String sql = "update mini_dat set likey=likey-1 where datnum=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int datLikeDown(int datnum, String id) {
		int result = 0;
		String sql = "delete from mini_likey where datnum=? and id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			ps.setString(2, id);
			result = ps.executeUpdate();
			
			if(result == 1) {
				datLikeMinus(datnum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	
	
	public int checkBoard(int datnum, String id) {
		int result = 0;
		String sql = "select count(*) from mini_likey where num=? and id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			ps.setString(2, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int checkDat(int datnum, String id) {
		int result = 0;
		String sql = "select count(*) from mini_likey where datnum=? and id=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, datnum);
			ps.setString(2, id);
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
