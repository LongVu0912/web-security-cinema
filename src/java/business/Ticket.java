package business;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.eclipse.persistence.annotations.UuidGenerator;

@Entity
public class Ticket implements Serializable {

  @ManyToOne
  @JoinColumn(name = "showtime_id")
  private ShowTime showtime;

  @ManyToOne
  @JoinColumn(name = "seatclass_id")
  private SeatClass seatClass;

  @ManyToOne
  @JoinColumn(name = "invoice_id")
  private Invoice invoice;

  @Id
  @UuidGenerator(name = "UUID")
  @GeneratedValue(generator = "UUID")
  @Column(name = "ticket_id")
  private String ticketID;
  @Column(name = "seat_number")
  private int seatNumber;

  public String getTicketID() {
    return ticketID;
  }

  public void setTicketID(String ticketID) {
    this.ticketID = ticketID;
  }

  public ShowTime getShowtime() {
    return showtime;
  }

  public void setShowtime(ShowTime showtime) {
    this.showtime = showtime;
  }

  public SeatClass getSeatClass() {
    return seatClass;
  }

  public void setSeatClass(SeatClass seatClass) {
    this.seatClass = seatClass;
  }

  public Invoice getInvoice() {
    return invoice;
  }

  public void setInvoice(Invoice invoice) {
    this.invoice = invoice;
  }

  public int getSeatNumber() {
    return seatNumber;
  }

  public void setSeatNumber(int seatNumber) {
    this.seatNumber = seatNumber;
  }
}
