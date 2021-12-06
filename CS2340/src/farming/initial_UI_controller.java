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
import javafx.scene.input.MouseEvent;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

public class initial_UI_controller implements Initializable {

    @FXML
    private Rectangle box00;
    @FXML
    private Rectangle box01;
    @FXML
    private Rectangle box03;
    @FXML
    private Rectangle box10;
    @FXML
    private Rectangle box11;
    @FXML
    private Rectangle box12;
    @FXML
    private Rectangle box13;
    @FXML
    private Rectangle box20;
    @FXML
    private Rectangle box21;
    @FXML
    private Rectangle box22;
    @FXML
    private Rectangle box23;
    @FXML
    private Rectangle box30;
    @FXML
    private Rectangle box31;
    @FXML
    private Rectangle box32;
    @FXML
    private Rectangle box33;
    @FXML
    private Label money;
    @FXML
    private Rectangle box02;
//    Rectangle[] r = {box00, box01, box03, box10, box11, box12, box13, box20, box21, box22, box23, box30, box31, box32, box33};

    final private String empty_field = "f8dfdf";
    final private String seed_field = "c9b09e";
    final private String immature_field = "00ff00";
    final private String mature_field = "83a152";
    private int[][] colors = Farming.colors;
    @FXML
    private Label season;
    @FXML
    private Label player_name;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        season.setText("Season: " + Farming.selected_season);
        money.setText("Money: " + Farming.total_money);
        player_name.setText("Player: " + Farming.player_name);
        
        fill_farm();

    }

    @FXML
    private void box00_click_event(MouseEvent event) {

        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box00.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box00.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
//            Farming.inventory.add(new Inventory(Farming.selected_seed));
            Inventory.capacity--;
            Inventory.crops.get(0).setQuantity(Inventory.crops.get(0).getQuantity() + 1);
//            Inventory.crops.add(new Crop(Inventory.seeds.get(0).getName(), item_price, Integer.parseInt(q)));
            colors[0][0] = 1;
        }

    }

    @FXML
    private void box01_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box01.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box01.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
//            Farming.inventory.add(new Inventory(Farming.selected_seed));
            Inventory.capacity--;
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            colors[0][1] = 1;
        }
    }

    @FXML
    private void box02_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box02.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box02.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[0][2] = 1;
        }
    }

    @FXML
    private void box03_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box03.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box03.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[0][3] = 1;
        }
    }

    @FXML
    private void box10_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box10.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box10.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[1][0] = 1;
        }
    }

    @FXML
    private void box11_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box11.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box11.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[1][1] = 1;
        }
    }

    @FXML
    private void box12_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box12.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box12.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[1][2] = 1;
        }
    }

    @FXML
    private void box13_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box13.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box13.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[1][3] = 1;
        }
    }

    @FXML
    private void box20_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box20.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box20.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[2][0] = 1;
        }
    }

    @FXML
    private void box21_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box21.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box21.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[2][1] = 1;
        }
    }

    @FXML
    private void box22_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box22.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box22.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[2][2] = 1;
        }
    }

    @FXML
    private void box23_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box23.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box23.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[2][3] = 1;
        }
    }

    @FXML
    private void box30_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box30.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box30.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[3][0] = 1;
        }
    }

    @FXML
    private void box31_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box31.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box31.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[3][1] = 1;
        }
    }

    @FXML
    private void box32_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box32.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box32.setFill(javafx.scene.paint.Color.web(empty_field));
            Farming.inventory.seeds.get(0).setQuantity(Farming.inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[3][2] = 1;
        }
    }

    @FXML
    private void box33_clicked(MouseEvent event) {
        if (Inventory.capacity <= 0) {
            JOptionPane.showMessageDialog(null, "Not enough capacity");
            return;
        }
        String c = (box33.getFill() + "").substring(2, 8);
        if (check_color(c)) {
            box33.setFill(javafx.scene.paint.Color.web(empty_field));
//            Farming.total_money += 30;
//            money.setText("Money: " + Farming.total_money);
            Inventory.seeds.get(0).setQuantity(Inventory.seeds.get(0).getQuantity() + 1);
            Inventory.capacity--;
//            Inventory.number++;
            colors[3][3] = 1;
        }
    }

    @FXML
    private void inventory(ActionEvent event) throws IOException {
        Parent TableView = FXMLLoader.load(getClass().getResource("Inventory.fxml"));
        Scene TableViewscene = new Scene(TableView);
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(TableViewscene);
        window.show();
    }

    @FXML
    private void market(ActionEvent event) throws IOException {
        Parent TableView = FXMLLoader.load(getClass().getResource("Market.fxml"));
        Scene TableViewscene = new Scene(TableView);
        Stage window = (Stage) ((Node) event.getSource()).getScene().getWindow();
        window.setScene(TableViewscene);
        window.show();
    }

    private void fill_farm() {
        int random_color;
        if (Farming.start) {
            random_color = (int) Math.ceil((3 * Math.random()));
            colors[0][0] = random_color;
        } else {
            random_color = colors[0][0];
        }
        switch (random_color) {
            case 1:
                box00.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box00.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box00.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box00.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[0][1] = random_color;
        } else {
            random_color = colors[0][1];
        }
        switch (random_color) {
            case 1:
                box01.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box01.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box01.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box01.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[0][2] = random_color;
        } else {
            random_color = colors[0][2];
        }
        switch (random_color) {
            case 1:
                box02.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box02.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box02.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box02.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[0][3] = random_color;
        } else {
            random_color = colors[0][3];
        }
        switch (random_color) {
            case 1:
                box03.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box03.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box03.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box03.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[1][0] = random_color;
        } else {
            random_color = colors[1][0];
        }
        switch (random_color) {
            case 1:
                box10.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box10.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box10.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box10.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[1][1] = random_color;
        } else {
            random_color = colors[1][1];
        }
        switch (random_color) {
            case 1:
                box11.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box11.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box11.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box11.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[1][2] = random_color;
        } else {
            random_color = colors[1][2];
        }
        switch (random_color) {
            case 1:
                box12.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box12.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box12.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box12.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[1][3] = random_color;
        } else {
            random_color = colors[1][3];
        }
        switch (random_color) {
            case 1:
                box13.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box13.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box13.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box13.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[2][0] = random_color;
        } else {
            random_color = colors[2][0];
        }
        switch (random_color) {
            case 1:
                box20.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box20.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box20.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box20.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[2][1] = random_color;
        } else {
            random_color = colors[2][1];
        }
        switch (random_color) {
            case 1:
                box21.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box21.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box21.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box21.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[2][2] = random_color;
        } else {
            random_color = colors[2][2];
        }
        switch (random_color) {
            case 1:
                box22.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box22.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box22.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box22.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[2][3] = random_color;
        } else {
            random_color = colors[2][3];
        }
        switch (random_color) {
            case 1:
                box23.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box23.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box23.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box23.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[3][0] = random_color;
        } else {
            random_color = colors[3][0];
        }
        switch (random_color) {
            case 1:
                box30.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box30.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box30.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box30.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[3][1] = random_color;
        } else {
            random_color = colors[3][1];
        }
        switch (random_color) {
            case 1:
                box31.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box31.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box31.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box31.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[3][2] = random_color;
        } else {
            random_color = colors[3][2];
        }
        switch (random_color) {
            case 1:
                box32.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box32.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box32.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box32.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        if (Farming.start) {
            random_color = (int) Math.ceil((4 * Math.random()));
            colors[3][3] = random_color;
        } else {
            random_color = colors[3][3];
        }
        switch (random_color) {
            case 1:
                box33.setFill(javafx.scene.paint.Color.web(empty_field));
                break;
            case 2:
                box33.setFill(javafx.scene.paint.Color.web(seed_field));
                break;
            case 3:
                box33.setFill(javafx.scene.paint.Color.web(immature_field));
                break;
            case 4:
                box33.setFill(javafx.scene.paint.Color.web(mature_field));
                break;

        }
        Farming.start = false;
//        show();
    }

    private boolean check_color(String color) {
        return color.equals(mature_field);
    }

    void show() {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(colors[i][j] + " ");
            }
            System.out.println("");
        }
    }

}
