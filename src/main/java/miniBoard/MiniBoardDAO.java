package miniBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;
import miniBoard.MiniBoardDTO;

public class MiniBoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
		
	public MiniBoardDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<MiniBoardDTO> boardList(int start, int end) {
		if(start==0) {
			start+=1;
		}
		String sql="select B.* from\r\n"
				+ "(select rownum rn,A.* from\r\n"
				+ "(select * from mini_board order by num desc)A)B\r\n"
				+ "where rn between ? and ?";
		ArrayList<MiniBoardDTO> list=new ArrayList<MiniBoardDTO>();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				MiniBoardDTO dto=new MiniBoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setHit(rs.getInt("hit"));
				dto.setLikey(rs.getInt("likey"));
				dto.setTitle(rs.getString("title"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int boardSave(MiniBoardDTO dto){
		int result=0;
		String sql="insert into mini_board(num,id,nickname,title,content,hit,likey) "
				+"values(mini_board_seq.nextval,?,?,?,?,0,0)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getNickname());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public MiniBoardDTO getContent(String num) {
		String sql="select * from mini_board where num="+num;
		MiniBoardDTO dto=null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto=new MiniBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setLikey(rs.getInt("likey"));
				dto.setSavedate(rs.getTimestamp("savedate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void boardDelete(String num) {
		String sql="delete from mini_board where num="+num;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int pageCount(){
		int cnt=0;
		String sql="select count(*) from mini_board";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public PageCount pagingNum(int start){
		if(start==0) {
			start+=1;
		}
		
		PageCount pc=new PageCount();
		int pageSu=3;//한 페이지당 보여질 글 개수
		int total=pageCount();//글 총 개수 얻어옴
		int allPage=0;
		
		
		allPage=total/pageSu;
		if(total % pageSu !=0 ) {
			allPage+=1;
		}
		pc.setTotPage(allPage);
		
		
		pc.setStartPage( ( (start-1) * pageSu ) +1 );
		
		pc.setEndPage( start * pageSu);
		
		return pc;
		
	}
	
	public void hitUp(int num){
		String sql="update mini_board set hit=hit+1 where num="+num;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * public void likeyUp(int num){ String
	 * sql="update mini_board set likey=likey+1 where num="+num; try {
	 * ps=con.prepareStatement(sql); ps.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); } }
	 * 
	 * public void likeyDown(int num){ String
	 * sql="update mini_board set likey=likey-1 where num="+num; try {
	 * ps=con.prepareStatement(sql); ps.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); } }
	 */
	
	
	
	public void boardModify(MiniBoardDTO dto) {
		String sql="update mini_board set title=?,content=? where num=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNum());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}











