import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<String> arr = new ArrayList<String>(4);
        arr.add("apple");
        arr.add("pear");
        arr.add("banana");
        arr.add("dragonfruit");

        public static void removeEvenStrings(ArrayList<String> input) {
            int index = 0;
            for (String str : input) {
                if ((str.length() % 2) == 0) {
                    arr.remove(index);
                    index--;
                }
                index++;
            }
        }

    }
}
