package farming;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

public class MarketController implements Initializable {

    @FXML
    private TableColumn<String, Crop> i_item;
    @FXML
    private TableColumn<Integer, Crop> i_price;
    @FXML
    private TableColumn<Integer, Crop> quantity;
    @FXML
    private TableView<Crop> inventory_table;
    @FXML
    private TableView<Item> market_table;
    @FXML
    private TableColumn<String, Item> m_item;
    @FXML
    private TableColumn<String, Item> m_price;

    @FXML
    private Label capacity;
    @FXML
    private Label money;

    @FXML
    private TableView<Seed> seed_table;
    @FXML
    private TableColumn<String, Seed> seed_col;
    @FXML
    private TableColumn<String, Seed> price_col;
    @FXML
    private RadioButton ItemR;
    @FXML
    private ToggleGroup table;
    @FXML
    private RadioButton SeedR;

    /**
     * Initializes the controller class.
     *
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        capacity.setText("Capacity: " + (Inventory.total - Inventory.capacity) + "/" + Inventory.total);
        money.setText("Money: " + Farming.total_money);
//        if(Farming.inventory_check){
        inventory();
//            Farming.inventory_check = false;
//        }
    }

    @FXML
    private void sell(ActionEvent event) {
        Crop selectedItem = inventory_table.getSelectionModel().getSelectedItem();
        int index = inventory_table.getSelectionModel().getSelectedIndex();
        System.out.println(index + "\tIndex");
        try {
            Farming.total_money += selectedItem.getPrice() * selectedItem.getQuantity();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Select a row in inventory table ");
            return;
        }

        inventory_table.getItems().remove(selectedItem);
        money.setText("Money: " + Farming.total_money);
        Inventory.capacity += selectedItem.getQuantity();
        capacity.setText("Capacity: " + (Inventory.total - Inventory.capacity) + "/" + Inventory.total);
    }

    @FXML
    private void buy(ActionEvent event) {

        if (ItemR.isSelected()) {
            Item selected_item = market_table.getSelectionModel().getSelectedItem();
            String item_name;
            try {
                item_name = selected_item.getName();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Select an item in item table ");
                return;
            }

            int item_price = selected_item.getPrice();
            String q = JOptionPane.showInputDialog("Enter Quantity");
            if (item_price * Integer.parseInt(q) <= Farming.total_money) {
                if (Inventory.capacity < Integer.parseInt(q)) {
                    JOptionPane.showMessageDialog(null, "Not enough capacity");
                    return;
                }
                Inventory.capacity -= Integer.parseInt(q);
                Farming.total_money -= item_price * Integer.parseInt(q);
                money.setText("Money: " + Farming.total_money);
                capacity.setText("Capacity: " + (Inventory.total - Inventory.capacity) + "/" + Inventory.total);

            } else {
                JOptionPane.showMessageDialog(null, "not enough money");
                return;
            }

            Inventory.crops.add(new Crop(item_name, item_price, Integer.parseInt(q)));
        } else if (SeedR.isSelected()) {
            Seed selected_item = seed_table.getSelectionModel().getSelectedItem();
            String seed_name;
            try {
                seed_name = selected_item.getName();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Select a seed in seed table ");
                return;
            }

            int seed_price = selected_item.getQuantity();
            String q = JOptionPane.showInputDialog("Enter Quantity");
            if (seed_price * Integer.parseInt(q) <= Farming.total_money) {
                System.out.println(Inventory.capacity);
                if (Inventory.capacity < Integer.parseInt(q)) {
                    JOptionPane.showMessageDialog(null, "Not enough capacity");
                    return;
                }
                Inventory.capacity -= Integer.parseInt(q);
                Farming.total_money -= seed_price * Integer.parseInt(q);
                money.setText("Money: " + Farming.total_money);
                capacity.setText("Capacity: " + (Inventory.total - Inventory.capacity) + "/" + Inventory.total);
            } else {
                JOptionPane.showMessageDialog(null, "not enough money");
                return;
            }

            Inventory.crops.add(new Crop(seed_name, seed_price, Integer.parseInt(q)));
            Inventory.seeds.add(new Seed(seed_name));
            Farming.inventory_check = true;
        } else {
            JOptionPane.showMessageDialog(null, "Please select a radio button");
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

    void inventory() {
        if (Farming.market_check) {
            fill();
            Farming.market_check = false;
        }
        i_item.setCellValueFactory(new PropertyValueFactory<>("name"));
        i_price.setCellValueFactory(new PropertyValueFactory<>("price"));
        quantity.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        inventory_table.setItems(Inventory.crops);
        m_item.setCellValueFactory(new PropertyValueFactory<>("name"));
        m_price.setCellValueFactory(new PropertyValueFactory<>("price"));
        market_table.setItems(Farming.items);
        seed_col.setCellValueFactory(new PropertyValueFactory<>("name"));
        price_col.setCellValueFactory(new PropertyValueFactory<>("quantity"));
        seed_table.setItems(Farming.seed);
    }

    static void fill() {
        int q;
        try {
            q = Inventory.seeds.get(0).getQuantity();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Select a seed in seed table ");
            return;
        }

        String crop_name = Inventory.seeds.get(0).getName();
        int price = Farming.price * 10;
//        int price = Farming.pricing_factor * (Farming.price + Farming.tax);
        Inventory.crops.add(new Crop(crop_name, price, q));

    }

    @FXML
    private void update(ActionEvent event) throws IOException {
        int price;
        int index;
        if (SeedR.isSelected()) {
            Seed selected_item = seed_table.getSelectionModel().getSelectedItem();
            try {
                price = Integer.parseInt(JOptionPane.showInputDialog("Enter New Price For " + selected_item.getName()));
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Select aa seed in seed table ");
                return;
            }
            
            index = seed_table.getSelectionModel().getSelectedIndex();
            Farming.seed.get(index).setQuantity(price);
            Parent TableView = FXMLLoader.load(getClass().getResource("initial_UI.fxml"));
            Scene TableViewscene = new Scene(TableView);
            Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
            window.setScene(TableViewscene);
            window.show();
//            Farming.market_check = true;
//            inventory();
        } else if (ItemR.isSelected()) {
            Item selected_item = market_table.getSelectionModel().getSelectedItem();
            try {
                price = Integer.parseInt(JOptionPane.showInputDialog("Enter New Price For " + selected_item.getName()));
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Select an item in item table ");
                return;
            }
            index = market_table.getSelectionModel().getSelectedIndex();
            Farming.items.get(index).setPrice(price);
            Parent TableView = FXMLLoader.load(getClass().getResource("initial_UI.fxml"));
            Scene TableViewscene = new Scene(TableView);
            Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
            window.setScene(TableViewscene);
            window.show();
//            Farming.market_check = true;
//            inventory();
        } else {
            JOptionPane.showMessageDialog(null, "Please select a radio button");
        }

    }

}
