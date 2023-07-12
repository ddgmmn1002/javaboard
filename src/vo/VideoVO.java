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
	private String[] genre;
	private String director;
	private String[] cast;
	private String plot;
	private Date release_date;
	private int runtime;
	private String film_rating;
	private String country;
	private String[] language;
	private String image;
	private String[] category;
	private int episodes_count;
	private String[] series;
}
