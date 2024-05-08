package business;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.sql.Time;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import org.eclipse.persistence.annotations.UuidGenerator;

@Entity
public class ShowTime implements Serializable {

  @OneToMany(mappedBy = "showtime")
  private List<Ticket> tickets;

  @ManyToOne
  @JoinColumn(name = "movie_id")
  private Movie movie;

  @ManyToOne
  @JoinColumn(name = "room_number")
  private Room room;

  @Id
  @UuidGenerator(name = "UUID")
  @GeneratedValue(generator = "UUID")
  @Column(name = "showtime_id")
  private String showtimeId;
  @Column(name = "show_date")
  private Date date;
  @Column(name = "start_time")
  private Time startTime;
  private int price;

  public List<Ticket> getTickets() {
    return tickets;
  }

  public void setTickets(List<Ticket> tickets) {
    this.tickets = tickets;
  }

  public String getShowtimeId() {
    return showtimeId;
  }

  public void setShowtimeId(String showtimeId) {
    this.showtimeId = showtimeId;
  }

  public Room getRoom() {
    return room;
  }

  public void setRoom(Room room) {
    this.room = room;
  }

  public Movie getMovie() {
    return movie;
  }

  public void setMovie(Movie movie) {
    this.movie = movie;
  }

  public Time getStartTime() {
    return startTime;
  }

  public LocalTime getStartTime_ToMinute() {
    return startTime.toLocalTime().withSecond(0);
  }

  public LocalTime getEndTime_ToMinute() {
    LocalTime endTime = startTime.toLocalTime();
    LocalTime duration = movie.getDuration().toLocalTime();

    endTime = endTime.plusHours(duration.getHour());
    endTime = endTime.plusMinutes(duration.getMinute());

    return endTime;
  }

  public String getStartTimeStr() {
    SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss");
    String startTimeStr = formatter.format(this.startTime);
    return startTimeStr;
  }

  public void setStartTime(Time starTime) {
    this.startTime = starTime;
  }

  public Date getDate() {
    return date;
  }

  public String getDayOfWeek() {
    return date.toLocalDate()
        .getDayOfWeek()
        .getDisplayName(TextStyle.FULL, Locale.getDefault());
  }

  public String getDateStr() {
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
    String strDate = formatter.format(this.date);
    return strDate;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

}
