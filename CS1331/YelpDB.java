import java.util.Scanner;
import java.io.File;
import java.util.ArrayList;
/**
* @author Azha Qari
* @version 1.0
* I did this assignment on my own using only course materials
*/
public class YelpDB {
    /**
    * Main method.
    * @param args the command line arguments.
    */
    public static void main(String[] args) {
        String restaurantName = args[0];
        String reviewName = args[1];

        File file1 = new File("database_restaurants");

        try {
            System.out.println(readReview(file1, load(file1), restaurantName, reviewName));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
    * Method to load a file.
    * @return returns an ArrayList with restaurant objects.
    * @param f a file object
    */
    public static ArrayList<Restaurant> load(File f) {
        return loadHelper(f, new ArrayList<Restaurant>());
    }
    /**
    * Method to help the load method.
    * @return returns an ArrayList with restaurant objects.
    * @param f a file object.
    * @param arr an ArrayList with restaurant objects.
    */
    public static ArrayList<Restaurant> loadHelper(File f, ArrayList<Restaurant> arr) {
        if (f.getName().length() >= 10 && f.getName().substring(0, 10).equals("restaurant")) {
            if (f.isDirectory()) {
                arr.add(new Restaurant(f.getName().substring(10), f.list().length));
            }
        } else if (f.isDirectory()) {
            String[] str = f.list();
            File file;
            for (String string : str) {
                file = new File(f.getAbsolutePath() + "/" + string);
                loadHelper(file, arr);
            }
        }
        return arr;
    }
    /**
    * Method to count the number of reviews.
    * @return returns the number of reviews as an int.
    * @param arr a passed in Restaurant ArrayList.
    */
    public static int countNumReviews(ArrayList<Restaurant> arr) {
        int totalReviews = 0;
        for (Restaurant res : arr) {
            totalReviews += res.getNumReviews();
        }
        return totalReviews;
    }
    /**
    * Method to read the reviews.
    * @return returns the number of review rating as a double.
    * @param f a passed in file object
    * @param arr a passed in Restaurant ArrayList.
    * @param restaurantName the string name of the restaurant.
    * @param reviewName the string name of reviewer.
    */
    public static double readReview(File f, ArrayList<Restaurant> arr,
        String restaurantName, String reviewName) throws NotARestaurantException, ReviewNotFoundException {
        boolean b = false;
        for (int i = 0; i < arr.size(); i++) {
            if (arr.get(i).getName().contains(restaurantName)) {
                b = true;
            }
        }
        if (!b) {
            throw new NotARestaurantException();
        }
        File fi = readReviewHelper(f, restaurantName);
        File review = new File(fi.getAbsolutePath() + "/review" + reviewName + ".txt");
        try {
            Scanner scan = new Scanner(review);
            scan.nextLine();
            scan.nextLine();
            scan.next();
            double num = scan.nextDouble();
            return num;
        } catch (Exception e) {
            e.printStackTrace();
        }
        throw new ReviewNotFoundException("That is not a review!");
    }
    /**
    * Method to help the readReview method.
    * @return returns a file object.
    * @param f a passed in file object.
    * @param restaurantName a passed in string name for the restaurant.
    */
    public static File readReviewHelper(File f, String restaurantName) {
        if (f.getName().equals("restaurant" + restaurantName)) {
            return f;
        }
        if (f.isDirectory()) {
            File[] file = f.listFiles();
            if (file.length == 0) {
                return null;
            }
            for (File fi : file) {
                File f1 = readReviewHelper(fi, restaurantName);
                if (f1 != null) {
                    return f1;
                }
            }
        }
        return null;
    }
}
