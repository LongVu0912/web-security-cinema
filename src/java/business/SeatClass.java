package business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

@Entity
public class SeatClass implements Serializable {

  @OneToMany(mappedBy = "seatClass", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
  private List<Ticket> tickets;
  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seatClassSquenceGenerator")
  @SequenceGenerator(name = "seatClassSquenceGenerator", sequenceName = "seat_class_sequence")
  private int id;

  private String category;
  private double factor;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public double getFactor() {
    return factor;
  }

  public void setFactor(double factor) {
    this.factor = factor;
  }

  public List<Ticket> getTickets() {
    return tickets;
  }

  public void setTickets(List<Ticket> tickets) {
    this.tickets = tickets;
  }

  public boolean isEmpty() {
    throw new UnsupportedOperationException("Not supported yet.");
  }
}
