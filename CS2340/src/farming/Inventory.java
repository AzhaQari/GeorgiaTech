package farming;

import java.util.ArrayList;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class Inventory {

    public static ObservableList<Seed> seeds;
    public static ObservableList<Crop> crops;
    public static ObservableList<Item> items;
    public static int capacity;
    public static int total;

    public Inventory() {
        seeds = FXCollections.observableArrayList();
        crops = FXCollections.observableArrayList();
        crops = FXCollections.observableArrayList();
    }
    
    

    
    
}
