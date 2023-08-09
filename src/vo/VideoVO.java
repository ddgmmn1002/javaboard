package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoVO {
	private int vno;
	private String title;
	private String genre;
	private String director;
	private String cast;
	private String plot;
	private Date releaseDate;
	private int runtime;
	private String filmRating;
	private String language;
	private String category;
	private String poster;
	private String trailer;
}
