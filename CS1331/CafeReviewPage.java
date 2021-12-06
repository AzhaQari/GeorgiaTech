//i worked on this hw alone
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.geometry.Insets;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;

/**
* @author Azha Qari
* @version 1.0
* I worked on this assignment alone, using only notes/google
*/
public class CafeReviewPage extends Application {
    /**
    * This is the main method.
    * @param args a passed in string list of arguments.
    */
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Cafe1331 Reviews");
        BorderPane pane1 = new BorderPane(); //main pane

        VBox vBox = new VBox(15);
        vBox.setPadding(new Insets(15, 5, 5, 5));
        vBox.setStyle("-fx-background-color: gold");
        Label lab = new Label("REVIEWS:");
        lab.setFont(new Font("Arial", 30));
        vBox.getChildren().add(lab);

        Button b1 = new Button("Post");

        TextField name = new TextField();
        name.setPromptText("Name");
        TextField feedback = new TextField();
        feedback.setPromptText("Feedback");
        TextField color = new TextField();
        color.setPromptText("Desired Font Color");
        TextField rating = new TextField();
        rating.setPromptText("Rating (0-5)");

        HBox hBox = new HBox(0);
        hBox.setPadding(new Insets(10, 10, 10, 10));
        hBox.setStyle("-fx-background-color: black");
        hBox.getChildren().add(name);
        hBox.getChildren().add(feedback);
        hBox.getChildren().add(color);
        hBox.getChildren().add(rating);
        hBox.getChildren().add(b1);


        // Place nodes in the pane
        pane1.setTop(vBox);
        pane1.setBottom(hBox);

        b1.setOnAction(e -> {
            if (feedback.getText().length() > 0) {
                String n = name.getText();
                if (n.length() == 0) {
                    n = "Anonymous";
                }
                String fb = feedback.getText();
                String c = color.getText().toUpperCase(); //default color is black, Catch Exceptions?
                String r = rating.getText();
                if (r.length() == 0 || (!r.equals("0") && !r.equals("1") && !r.equals("2")
                    && !r.equals("3") && !r.equals("4") && !r.equals("5"))) {
                    r = "5";
                }

                Label l = new Label(n + ":\n" + fb + "\n" + r + "/5 Stars");

                try {
                    if (!c.equals("BLACK") && c.length() != 0) {
                        l.setTextFill(Color.valueOf(c));
                    } else {
                        l.setTextFill(Color.BLACK);
                    }
                } catch (Exception ex) {
                    l.setTextFill(Color.BLACK);
                }


                vBox.getChildren().add(l);

                name.clear();
                feedback.clear();
                color.clear();
                rating.clear();
            }
        });

        Scene scene = new Scene(pane1);
        primaryStage.setScene(scene); // Place the scene in the stage
        primaryStage.setHeight(500);
        primaryStage.setWidth(704);
        primaryStage.show();
    }
}
