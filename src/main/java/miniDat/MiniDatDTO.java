package miniDat;

import java.sql.Timestamp;

public class MiniDatDTO {
	private int num;
	private String id, nickname, content;
	private Timestamp savedate;
	private int datnum;
	
	
	public int getNum() {
		return num;
	}
	public int getDatnum() {
		return datnum;
	}
	public void setDatnum(int datnum) {
		this.datnum = datnum;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		this.savedate = savedate;
	}
	
}
