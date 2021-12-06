/**
* @author Azha Qari
* @version 1.0
* I did this assignment on my own using only course materials
*/
public class NotARestaurantException extends RuntimeException {
    /**
    * Constructor for NotARestaurantException that takes in no parameters.
    */
    public NotARestaurantException() {
        super("That is not a restaurant we know!");
    }
}
