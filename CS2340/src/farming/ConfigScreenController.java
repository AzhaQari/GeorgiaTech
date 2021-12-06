/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author Sardar Tariq Khan
 */
public class ConfigScreenController implements Initializable {

    @FXML
    private TextField name;
    @FXML
    private RadioButton easyR;
    @FXML
    private ToggleGroup difficulty;
    @FXML
    private RadioButton mediumR;
    @FXML
    private RadioButton hardR;
    @FXML
    private RadioButton wheatR;
    @FXML
    private ToggleGroup seeds;
    @FXML
    private RadioButton riceR;
    @FXML
    private RadioButton cornR;
    @FXML
    private RadioButton springR;
    @FXML
    private ToggleGroup season;
    @FXML
    private RadioButton summerR;
    @FXML
    private RadioButton fallR;
    @FXML
    private RadioButton winterR;
    @FXML
    private RadioButton potato;
    @FXML
    private RadioButton Onion;
    @FXML
    private RadioButton cabbage;
    boolean season_check = false;
    boolean seed_check = false;
    boolean dificulty_check = false;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }

    @FXML
    private void next(ActionEvent event) throws IOException {
        Farming.player_name = name.getText();
        if (!name.getText().equals("")) {
            if (season_check) {
                if (seed_check) {
                    if (dificulty_check) {

                    } else {
                        JOptionPane.showMessageDialog(null, "Select a difficulty first");
                        return;
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Select a seed first");
                    return;
                }
            } else {
                JOptionPane.showMessageDialog(null, "Select a season first");
                return;
            }
        } else {
            JOptionPane.showMessageDialog(null, "Enter your name first");
            return;
        }
        Farming.fill_items();
        Parent TableView = FXMLLoader.load(getClass().getResource("initial_UI.fxml"));
        Scene TableViewscene = new Scene(TableView);
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(TableViewscene);
        window.show();
    }

    @FXML
    private void easy(ActionEvent event) {
        Farming.selected_difficulty = "easy";
        Farming.total_money = 300;
        Farming.pricing_factor = 1;
        Inventory.capacity = 30;
        Inventory.total = 30;
        dificulty_check = true;
    }

    @FXML
    private void medium(ActionEvent event) {
        Farming.selected_difficulty = "medium";
        Farming.total_money = 200;
        Farming.pricing_factor = 2;
        Inventory.capacity = 20;
        Inventory.total = 20;
        dificulty_check = true;
    }

    @FXML
    private void hard(ActionEvent event) {
        Farming.selected_difficulty = "hard";
        Farming.total_money = 100;
        Farming.pricing_factor = 3;
        Inventory.capacity = 10;
        Inventory.total = 10;
        dificulty_check = true;
    }

    @FXML
    private void wheat(ActionEvent event) {
        Farming.selected_seed = "wheat";
        Inventory.seeds.add(new Seed(0, "Wheat"));
        Farming.price = 2;
        seed_check = true;
    }

    @FXML
    private void rice(ActionEvent event) {
        Farming.selected_seed = "rice";
        Inventory.seeds.add(new Seed(0, "Rice"));
        Farming.price = 2;
        seed_check = true;
    }

    @FXML
    private void corn(ActionEvent event) {
        Farming.selected_seed = "corn";
        Inventory.seeds.add(new Seed(0, "Corn"));
        Farming.price = 3;
        seed_check = true;
    }

    @FXML
    private void potato(ActionEvent event) {
        Farming.selected_seed = "potato";
        Inventory.seeds.add(new Seed(0, "potato"));
        Farming.pricing_factor = 4;
        seed_check = true;
    }

    @FXML
    private void onion(ActionEvent event) {
        Farming.selected_seed = "onion";
        Inventory.seeds.add(new Seed(0, "Onion"));
        Farming.price = 5;
        seed_check = true;
    }

    @FXML
    private void cabbage(ActionEvent event) {
        Farming.selected_seed = "cabbage";
        Farming.inventory.seeds.add(new Seed(0, "Cabbage"));
        Farming.price = 7;
        seed_check = true;

    }

    @FXML
    private void spring(ActionEvent event) {
        Farming.selected_season = "spring";
        season_check = true;
    }

    @FXML
    private void summer(ActionEvent event) {
        Farming.selected_season = "summer";
        season_check = true;
    }

    @FXML
    private void fall(ActionEvent event) {
        Farming.selected_season = "fall";
        season_check = true;
    }

    @FXML
    private void winter(ActionEvent event) {
        Farming.selected_season = "winter";
        season_check = true;
    }

}
