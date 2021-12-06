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
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Sardar Tariq Khan
 */
public class WelcomeScreenController implements Initializable {

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void startAction(ActionEvent event) throws IOException {
        Parent TableView = FXMLLoader.load(getClass().getResource("config_screen.fxml"));
        Scene TableViewscene = new Scene(TableView);
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(TableViewscene);
        window.show();
    }
    
}
