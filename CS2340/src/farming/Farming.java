
package farming;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Farming extends Application {


    public static String selected_difficulty;
    public static String selected_seed;
    public static String selected_season;
    public static int total_money = 100;
    public static Inventory inventory = new Inventory();
    public static boolean start = true;
    public static int[][] colors = new int[4][4];
    public static int pricing_factor;
    public static final int tax = 2;
    public static int price;
    public static boolean inventory_check = true;
    public static boolean inventory_check2 = true;
    public static boolean market_check = true;
    public static String player_name;
    public static ObservableList<Item> items = FXCollections.observableArrayList();
    public static ObservableList<Seed> seed = FXCollections.observableArrayList();
    public static void main(String[] args) {
        
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("welcome_screen.fxml"));
        primaryStage.setTitle("Farming Game");
        primaryStage.setScene(new Scene(root, 500, 300));
        primaryStage.show();
    }
    
    public static void fill_items() {
        items.addAll(new Item("Compost", pricing_factor * (5 + tax)),
                new Item("Sickle", pricing_factor * (10 + tax)),
                new Item("Scare Crow", pricing_factor * (300 + tax)),
                new Item("Wagon", pricing_factor * (500 + tax)),
                new Item("Fence", pricing_factor * (50 + tax)));
        seed.addAll(new Seed(pricing_factor * (4 + tax), "Potato"),
                new Seed(pricing_factor * (5 + tax), "Onion"),
                new Seed(pricing_factor * (7 + tax), "Cabbage"),
                new Seed(pricing_factor * (2 + tax), "Wheat"),
                new Seed(pricing_factor * (3 + tax), "Corn"),
                new Seed(pricing_factor * (2 + tax), "Rice"));
    }
    
}
