package entity;

public class User {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private int role;

    public User() {}

    public User(int id, String username, String password, String fullname, int role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
    }

    // Getter và Setter (Bắt buộc phải có để JSP lấy được dữ liệu)
    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getFullname() { return fullname; }
    public int getRole() { return role; }
}