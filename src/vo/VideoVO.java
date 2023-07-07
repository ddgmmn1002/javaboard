package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoVO {
	int vno;
	String title;
	String[] genre;
	String director;
	String[] cast;
	String plot;
	Date release_date;
	int runtime;
	String film_rating;
	String country;
	String[] language;
	String image;
	String[] category;
	int episodes_count;
	String[] series;
}
