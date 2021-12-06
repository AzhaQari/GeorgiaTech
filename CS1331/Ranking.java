/* Given the following enum
 *
 * 1) Add a boolean attribute 'professional' to classify each of the rankings.
 * Assume only the Master, Grandmaster, and Challenger rankings are considered professional
 * Make this variable public and final.
 * Make sure to write a constructor to set this attribute.
 *
 * 2) Write a method 'tier' that takes in no arguments but
 * returns an int representing how high the ranking is
 * Assume the list is in order
 * ex. tier on IRON returns 1 while calling it on GOLD returns 4.
 */
public enum Ranking {
    IRON(false),
    BRONZE(false),
    SILVER(false),
    GOLD(false),
    PLATINUM(false),
    DIAMOND(false),
    MASTER(true),
    GRANDMASTER(true),
    CHALLENGER(true);
    public final boolean professional;
    private Ranking(boolean b){
        this.professional = b;
    }
    public int tier() {
        return this.ordinal() + 1;
    }

}
