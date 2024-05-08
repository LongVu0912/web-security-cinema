package data;

import jakarta.mail.*;
import java.util.Properties;

public class MailUtilGmailDB {
  public static void sendMail(String to, String subject, String body)
      throws MessagingException {

    final String senderMail = "nhanhohuunhan7398@gmail.com";
    final String password = "wkygegblzwkiqsbf";

    // Setting up mail server properties
    Properties prop = new Properties();
    prop.put("mail.smtp.host", "smtp.gmail.com");
    prop.put("mail.smtp.port", "587");
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.starttls.enable", "true"); // TLS

    // Creating a new session with an authenticator
    jakarta.mail.Session session = jakarta.mail.Session.getInstance(prop, new jakarta.mail.Authenticator() {
      protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
        return new jakarta.mail.PasswordAuthentication(senderMail, password);
      }
    });

    try {
      // Create a default MimeMessage object
      jakarta.mail.Message message = new jakarta.mail.internet.MimeMessage(session);
      message.setFrom(new jakarta.mail.internet.InternetAddress(senderMail));
      message.setRecipients(jakarta.mail.Message.RecipientType.TO, jakarta.mail.internet.InternetAddress.parse(to));
      message.setSubject(subject);

      // Create the content of the email
      String content = body;

      message.setText(content);
      // Send message
      jakarta.mail.Transport.send(message);

    } catch (jakarta.mail.MessagingException e) {
      e.printStackTrace();
      System.out.println("Error: " + e.getMessage());
    }
  }
}
