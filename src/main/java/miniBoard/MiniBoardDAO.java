package miniBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class MiniBoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public MiniBoardDAO() {
		try {
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MiniBoardDTO> list(int start, int end) {
		if(start == 0) {
			start=1;
		}
		//String sql ="select * from mini_board";
		String sql ="select B.* from(select rownum rn, A.* from (select * from mini_board order by num desc)A)B where rn between ? and ?";
		
		ArrayList<MiniBoardDTO> list = new ArrayList<MiniBoardDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(getBoard());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public PageCount pagingNum(int start) {
		if(start==0) {
			start=1;
		}
		PageCount pc = new PageCount();
		int pageNum = 5; //한 페이지당 보여질 글 개수
		int totalPage = getTotalPage();//글 총 개수 얻어옴
		int allPage=0;
		allPage = totalPage / pageNum;
		if(totalPage % pageNum != 0)
			allPage += 1;
		
		pc.setTotEndPage(allPage);
		pc.setStartPage( (start-1) * pageNum + 1 );
		pc.setEndPage( pageNum * start );
		return pc;
	}
	
	public int getTotalPage() {
		String sql="select count(*) from mini_board";
		int count=0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int ch(String id, int num) {
		String sql="select * from likey where bno=? and ino=?";
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			result = ps.executeUpdate();
			System.out.println("result : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	public void update(MiniBoardDTO dto) {
		String sql="update mini_board set title=?, content=? where num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNum());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void delete(int num) {
		String sql="delete mini_board where num="+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void likeDown(int num, String id) {
		String sql="update mini_board set likey=likey-1 where num="+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("보드 좋아요 내림");
		
		sql="delete from likey where ino=? and bno=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("보드 좋아요 삭제");
	}
	
	public void likeUp(int num, String id) {
		String sql="update mini_board set likey=likey+1 where num="+num;
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(result);
		
		
		sql="insert into likey values(?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("보드 좋아요 추가");
	}
	
	public void upHit(int num) {
		String sql="update mini_board set hit=hit+1 where num="+num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MiniBoardDTO getContent(int num) {
		upHit(num);
		String sql="select * from mini_board where num="+num;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return getBoard();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private MiniBoardDTO getBoard() {
		MiniBoardDTO dto = new MiniBoardDTO();
		try {
			dto.setId(rs.getString("id"));
			dto.setNum(rs.getInt("num"));
			dto.setHit(rs.getInt("hit"));
			dto.setLikey(rs.getInt("likey"));
			dto.setNickname(rs.getString("nickname"));
			dto.setContent(rs.getString("content"));
			dto.setSavedate(rs.getTimestamp("savedate"));
			dto.setTitle(rs.getString("title"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void insert(String id, String nickname,String title,String content) {
		//(num, id, nickname, hit, likey, savedate, title,content)
		String sql="insert into mini_board(num, id, nickname, hit, likey, savedate, title,content)"
				+"values(mini_board_seq.nextval,?,?,0,0,sysdate,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, nickname);
			ps.setString(3, title);
			ps.setString(4, content);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
