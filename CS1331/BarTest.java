/**
     * Getter for the instances username.
     * @return the username.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Returns a display message depending on numUsers and displayNewest.
     * @return the correct welcome message.
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
     * Changes password if other information is correct.
     * @param usernameInput inputted username.
     * @param passwordInput inputted password.
     * @param newPassword desired new password.
     */
    public void changePassword(String usernameInput, int passwordInput, int newPassword) {
        if (usernameInput == username && passwordInput == password) {
            password = newPassword;
        }
    }

    /**
     * Returns if the login information is correct.
     * @param usernameInput the inputted username.
     * @param passwordInput the inputted password.
     * @return a boolean depending on if information is correct.
     */
    public boolean validLogin(String usernameInput, int passwordInput) {
        return (username == usernameInput && password == passwordInput);
    }
}
