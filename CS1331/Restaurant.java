/**
* @author Azha Qari
* @version 1.0
* I did this assignment on my own using only course materials
*/

public class Restaurant {
    private String name;
    private int numReviews;
    /**
    * Constructor for Restaurant that takes in 2 parameters.
    * @param name the name of the restaurant.
    * @param numReviews the number of reviews for the restaurant.
    */
    public Restaurant(String name, int numReviews) {
        this.name = name;
        this.numReviews = numReviews;
    }
    /**
    * Method to get name of a restaurant.
    * @return returns the name.
    */
    public String getName() {
        return name;
    }
    /**
    * Method to get number of reviews of a restaurant.
    * @return returns the numReviews.
    */
    public int getNumReviews() {
        return numReviews;
    }
}
