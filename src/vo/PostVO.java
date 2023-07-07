package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	int pno;
	String writer;
	String title;
	Timestamp created_at;
	Timestamp updated_ap;
	String content;
	String nickname;
	String grade;
	
}
