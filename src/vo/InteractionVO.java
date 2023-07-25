package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class InteractionVO {
	private int interactionId;
	private int pno;
	private String userId;
	private boolean likeStatus;
	private boolean dislikeStatus;
	private boolean viewStatus;
	private boolean commentStatus;
	private Timestamp interactedAt;
	private String title;
	private String ipAddress;
}
