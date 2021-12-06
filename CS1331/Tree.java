import java.util.ArrayList;
import java.util.List;
public class Tree {
    public static void main(String[] args) {
        List<String> groceryLine = new ArrayList<>();
        groceryLine.add("Jerome");
        groceryLine.add("Beth");
        groceryLine.add("Sam");
        System.out.println(groceryLine);

        System.out.println(groceryLine.size());

        groceryLine.remove(2);
        System.out.println(groceryLine);

        String beth = groceryLine.get(1);
        System.out.println(beth);

    }

 }
