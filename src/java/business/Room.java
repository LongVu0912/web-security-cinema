package business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

@Entity
public class Room implements Serializable {

  @OneToMany(mappedBy = "room")
  private List<ShowTime> showTimes;

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequence-generator")
  @SequenceGenerator(name = "sequence-generator", sequenceName = "the_sequence_name")
  @Column(name = "room_number")
  private int roomNumber;
  @Column(name = "max_seats")
  private int maxSeats;
  @Column(name = "screen_quality")
  private String screenQuality;

  public int getRoomNumber() {
    return roomNumber;
  }

  public void setRoomNumber(int roomNumber) {
    this.roomNumber = roomNumber;
  }

  public int getMaxSeats() {
    return maxSeats;
  }

  public void setMaxSeats(int maxSeats) {
    this.maxSeats = maxSeats;
  }

  public String getScreenQuality() {
    return screenQuality;
  }

  public void setScreenQuality(String screenQuality) {
    this.screenQuality = screenQuality;
  }

  public List<ShowTime> getShowTimes() {
    return showTimes;
  }

  public void setShowTimes(List<ShowTime> showTimes) {
    this.showTimes = showTimes;
  }
}
