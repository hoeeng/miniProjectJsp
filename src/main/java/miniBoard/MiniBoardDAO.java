package miniBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniBoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MiniBoardDAO() throws Exception{
		con = DBConnect.getConnection();
	}
	
	public MiniBoardDTO getBoard() {
		MiniBoardDTO dto = new MiniBoardDTO();
		
		try {
			dto.setId(rs.getString("id"));
			dto.setContent(rs.getString("content"));
			dto.setHit(rs.getInt("hit"));
			dto.setLikey(rs.getInt("likey"));
			dto.setNickname(rs.getString("nickname"));
			dto.setNum(rs.getInt("num"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setTitle(rs.getString("title"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public void hit(String title) {
		String sql = "update mini_board set hit=hit+1 where title=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MiniBoardDTO getBoard(String title) {
		MiniBoardDTO dto = new MiniBoardDTO();
		hit(title);
		String sql = "select * from mini_board where title=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = getBoard();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	public ArrayList<MiniBoardDTO> getList(int start, int end) {
		ArrayList<MiniBoardDTO> list = new ArrayList<>();
		String sql = "select B.* from(select rownum rn, A.* from(select * from mini_board order by num desc)A)B where rn between ? and ?";
	//String sql = "select * from (select rownum rn, mini_board.* from mini_board) where rn between ? and ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(getBoard());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int uploadPost(MiniBoardDTO dto) {
		int result = 0;
		String sql = "insert into mini_board values(mini_board_seq.nextval,?,?,0,0,sysdate,?,?)";
		// 게시글번호, id, nickname, 조회수, 좋아요, 저장일, 타이틀, 내용
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int modifyPost(MiniBoardDTO dto) {
		int result = 0;
		String sql = "update mini_board set title=?, content=? where num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNum());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getBoardCount(String id) {
		int result = 0;
		String sql = "select count(*) from mini_board where id=?";
		
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
	
	public int deleteBoard(int num) {
		int result = 0;
		String sql = "delete from mini_board where num=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int getTotalThreads() {
		int result = 0;
		String sql = "select count(*) from mini_board";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public PageCount pagingNum(int start) {
		PageCount pc = new PageCount();
		if (start == 0) {
			start = 1;
		}
		
		int ViewThreads = 10; 
		// 한 페이지당 보여질 글
		int totalThreads = getTotalThreads();
		// 글 총 개수를 얻어와서
		int totalPage = totalThreads / ViewThreads;
		
		if(totalThreads % ViewThreads != 0) {
			totalPage += 1;
		}
		
		pc.setTotEndPage(totalPage);
		pc.setStartPage( (start-1) * ViewThreads + 1);
		pc.setEndPage( ViewThreads * start );
		
		return pc;
	}
	
	

}
