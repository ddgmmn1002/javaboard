package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class InteractionVO {
	int interactionId;
	int pno;
	String userId;
	boolean likeStatus;
	boolean dislikeStatus;
	boolean viewStatus;
	boolean commentStatus;
	Timestamp interactedAt;
	String title;
}
