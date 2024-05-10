package business;

public class Attempt {
    private Integer attemptTimes;
    private String username;
    private String ipAddress;
    private String code = "";

    // get and set
    public Integer getAttemptTimes() {
        return attemptTimes;
    }

    public void setAttemptTimes(Integer attemptTimes) {
        this.attemptTimes = attemptTimes;
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

    // full args constructor
    public Attempt(Integer attempsTimes, String username, String ipAddress, String code) {
        this.attemptTimes = attempsTimes;
        this.username = username;
        this.ipAddress = ipAddress;
        this.code = code;
    }

    public Attempt(Integer attempsTimes, String username, String ipAddress) {
        this.attemptTimes = attempsTimes;
        this.username = username;
        this.ipAddress = ipAddress;
        this.code = "";
    }

}
