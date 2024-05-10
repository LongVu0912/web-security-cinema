package business;

public class Attemp {
    private Integer attempsTimes;
    private String username;
    private String ipAddress;
    private String code;

    // get and set
    public Integer getAttempsTimes() {
        return attempsTimes;
    }

    public void setAttempsTimes(Integer attempsTimes) {
        this.attempsTimes = attempsTimes;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    // constructor
    public Attemp(Integer attempsTimes, String username, String ipAddress) {
        this.attempsTimes = attempsTimes;
        this.username = username;
        this.ipAddress = ipAddress;
        this.code = null;
    }

    // full args constructor
    public Attemp(Integer attempsTimes, String username, String ipAddress, String code) {
        this.attempsTimes = attempsTimes;
        this.username = username;
        this.ipAddress = ipAddress;
        this.code = code;
    }

}
