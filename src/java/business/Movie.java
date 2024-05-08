package business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.sql.Time;

import org.eclipse.persistence.annotations.UuidGenerator;

@Entity
public class Movie implements Serializable {

  @OneToMany(mappedBy = "movie")
  private List<ShowTime> showTimes;

  @Id
  @UuidGenerator(name = "UUID")
  @GeneratedValue(generator = "UUID")
  @Column(name = "movie_id")
  private String movieID;

  @Column(unique = true)
  private String title;
  private String genre;
  private String director;
  @Column(name = "main_actor")
  private String mainActor;
  private Time duration;
  private String description;
  private String img;

  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public String getMainActor() {
    return mainActor;
  }

  public void setMainActor(String mainActor) {
    this.mainActor = mainActor;
  }

  public String getMovieID() {
    return movieID;
  }

  public void setMovieID(String movieID) {
    this.movieID = movieID;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getGenre() {
    return genre;
  }

  public void setGenre(String genre) {
    this.genre = genre;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public Time getDuration() {
    return duration;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getDescription() {
    return description;
  }

  public int getMins() {
    int mins = this.duration.toLocalTime().getHour() * 60 + this.duration.toLocalTime().getMinute();
    return mins;
  }

  public void setDuration(Time duration) {
    this.duration = duration;
  }

  public List<ShowTime> getShowTimes() {
    return showTimes;
  }

  public void setShowTimes(List<ShowTime> showTimes) {
    this.showTimes = showTimes;
  }
}
