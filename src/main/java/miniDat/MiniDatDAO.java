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
	
	public MiniDatDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MiniDatDTO> datList(int num) {
		System.out.println(num);
		String sql="select * from mini_dat where num="+num;
		ArrayList<MiniDatDTO> list=new ArrayList<MiniDatDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MiniDatDTO dto=new MiniDatDTO();
				System.out.println(num);
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("nickname"));
				System.out.println(rs.getString("content"));
				System.out.println(rs.getTimestamp("savedate"));
				System.out.println("=================");
				dto.setNum(num);
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setDatnum(rs.getInt("datnum"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//게시글 번호 , 현재 연결된 유저 아이디,닉네임, 댓글내용
	public int datSave(MiniDatDTO dto){
		int result=0;
		String sql="insert into mini_dat values(?,?,?,default,?,datnum_seq.nextval)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,dto.getNum());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getNickname());
			ps.setString(4, dto.getContent());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void datDelete(int datnum){
		String sql="delete from mini_dat where datnum="+datnum;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MiniDatDTO datSelect(String datnum) {
		String sql="select * from mini_dat where datnum="+datnum;
		MiniDatDTO dto=null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto =new MiniDatDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setContent(rs.getString("content"));
				dto.setDatnum(rs.getInt("datnum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void datModify(String datnum, String content){
		String sql="update mini_dat set content=? where datnum="+datnum;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, content);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}





