//I worked on the homework assignement alone, using only course materials.
/**
*This class represents the User object
*@author Azha Qari
*@version 1.0
*/

public class User {
    private String username = "";
    private int password = 0;
    private static int numUsers = 0;
    private static User newestUser = null;
    private static boolean displayNewest = true;

    /**
    *This constructor sets the username and password, and increments numUsers
    *@param username sets the username
    *@param password sets the password
    */
    public User(String username, int password) {
        this.username = username;
        this.password = password;
        numUsers++;
        newestUser = this;
    }
    /**
    *sets displayNewest
    *@param displayNewest sets displayNewest using this
    */
    public static void setDisplayNewest(boolean displayNewest) {
        displayNewest = displayNewest;
    }
    /**
    *this getter returns getNumUsers
    *@return returns the number of users
    */
    public static int getNumUsers() {
        return numUsers;
    }
    /**
    *this getter returns the getUsername
    *@return returns the username
    */
    public String getUsername() {
        return username;
    }

    /**
    *returns a string depending on the number of users and whether or not displayNewest is returnSquare
    *@return returns the corresponding message with the given conditions
    */
    public static String getWelcomeMessage() {
        if (numUsers == 0) {
            return "This site doesn't have any users yet!";
        }
        if (!displayNewest) {
            return "Welcome to our site! We have " + numUsers + " user(s) and counting!";
        } else {
            return newestUser.username + " just joined our site! Please give them a warm welcome!";
        }

    }

    /**
    *Creates a new password given the user types in the username and password correctly
    *@param usernameInput typed in usernameInput
    *@param passwordInput typed in passwordInput
    *@param newPassword the new desired password
    */
    public void changePassword(String usernameInput, int passwordInput, int newPassword) {
        if (usernameInput == username && passwordInput == password) {
            password = newPassword;
        }
    }

    /**
    *this indicates whether a the typed in username and password are correct
    *@param usernameInput is the typed username
    *@param passwordInput is the typed password
    *@return returns true or false depending on if the username and password match exactly
    */
    public boolean validLogin(String usernameInput, int passwordInput) {
        return (username == usernameInput && password == passwordInput);
    }
}
