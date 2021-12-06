/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package farming;

import static farming.MarketController.fill;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Sardar Tariq Khan
 */
public class InventoryController implements Initializable {

    @FXML
    private TableView<Crop> harvested_crops;
    @FXML
    private TableColumn<String, Crop> crop;
    @FXML
    private TableColumn<String, Crop> number;
    @FXML
    private ListView<String> seeds_table;
    @FXML
    private ListView<String> items_table;
    @FXML
    private Label capacity;
    static ObservableList<Crop> crop_list = FXCollections.observableArrayList();
    static ObservableList<String> seed = FXCollections.observableArrayList();
    static ObservableList<String> items = FXCollections.observableArrayList();

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        capacity.setText(capacity.getText() + " " + (Inventory.total - Inventory.capacity) + "/" + Inventory.total);
        fill_inventory();
        if (Farming.market_check) {
            fill();
            Farming.market_check = false;
        }
    }

    @FXML
    private void back(ActionEvent event) throws IOException {
        Parent TableView = FXMLLoader.load(getClass().getResource("initial_UI.fxml"));
        Scene TableViewscene = new Scene(TableView);
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(TableViewscene);
        window.show();
    }

    private void fill_inventory() {
        if (Farming.inventory_check2) {
            items.addAll("Compost", "Sickle", "Scare Crow", "Wagon", "Fence");
            Farming.inventory_check2 = false;
        }
        if (Farming.inventory_check) {
            fill_list();
            Farming.inventory_check = false;
        }
        crop.setCellValueFactory(new PropertyValueFactory<>("name"));
        number.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        harvested_crops.setItems(Inventory.crops);
        seeds_table.setItems(seed);
        items_table.setItems(items);
    }

    public void fill_list() {
        seed.clear();
        Inventory.seeds.forEach(x -> {
            seed.add(x.getName());
        });
    }

}
