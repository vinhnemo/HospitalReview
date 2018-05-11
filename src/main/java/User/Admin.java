package User;

/**
 *
 * @author TGMaster
 */
public class Admin {
    private int ID;
    private String username;
    private String email;
    private String pass;

    public Admin() {
    }

    public Admin(int ID, String username, String email, String pass) {
        this.ID = ID;
        this.username = username;
        this.email = email;
        this.pass = pass;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
