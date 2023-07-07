package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	int cno;
	String image;
	int post;
	String title;
	String writer;
	String content;
	Timestamp created_at;
	Timestamp updated_at;
	String nickname;
}
