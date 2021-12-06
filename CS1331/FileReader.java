import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReader {

    public static void main(String[] args) throws FileNotFoundException {
        //File commandsFile = new File(args[0]);
        int startIndex = 1;
        int endIndex = 1;
        int base = 0;
        int power = 0;
        String makeSubstring = " ";
        String capSubstring = " ";
        String text;
        Scanner fileScanner = new Scanner(commandsFile);
        while (fileScanner.hasNextLine()) {
            text = fileScanner.nextLine();
            if (text.contains("substring")) {
                String[] wordsSubstring = text.split(" ");
                makeSubstring = wordsSubstring[1];
                startIndex = Integer.parseInt(wordsSubstring[2]);
                endIndex = Integer.parseInt(wordsSubstring[3]);
                System.out.println(makeSubstring(makeSubstring, startIndex, endIndex));
            }
            else if (text.contains("allcaps")) {
                String[] wordsAllcaps = text.split(" ");
                capSubstring = wordsAllcaps[1];
                System.out.println(allCaps(capSubstring));
            }
            else if (text.contains("power")) {
                String[] wordsPower = text.split(" ");
                base = Integer.parseInt(wordsPower[1]);
                power = Integer.parseInt(wordsPower[2]);
                System.out.println(power(base, power));
            }
        }
    }

    public static String allCaps(String capSubstring) {
        return capSubstring.toUpperCase();
    }

    public static double power(int base, int power) {
        int result = base;
        for(int i=0; i<power-1; i++) result = result*base;
        return result;
    }

    public static String makeSubstring(String makeSubstring, int startIndex, int endIndex) {
        try {
            return makeSubstring.substring(startIndex, endIndex);
        }
        catch (IndexOutOfBoundsException e) {
            return "Invalid command";
        }
    }
}
/*import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReader {

    public static void main(String[] args) throws FileNotFoundException {
    	File commandsFile = new File(args[0]);
        Scanner fileScanner = new Scanner(commandsFile);
        while (fileScanner.hasNext()) {
            String text = fileScanner.nextLine();
            if (text.contains("substring")) {
                String newSubstring = text.substring(11, text.length() - 3);
                int startIndex = Integer.parseInt(text.substring((text.length() - 3), (text.length() - 2)));
                int endIndex = Integer.parseInt(text.substring((text.length() - 1)));
                System.out.println(makeSubstring(String makeSubstring, int startIndex, int endIndex));
            }
            if (text.contains("allcaps")) {
                String capSubstring = text.substring(8);
                System.out.println(allCaps(String capSubstring))
            }
            if (text.contains("power")) {
                int base = Integer.parseInt(text.substring(6, 7));
                int power = Integer.parseInt(text.substring(8));
                System.out.println(power(int base, int power))
            }


        }

    }
    public static String allCaps(String capSubstring) {
        return capSubstring.toUpperCase();

    }

    public static double power(int base, int power) {
        return Math.pow(base, power);
    }

    public static String makeSubstring(String makeSubstring, int startIndex, int endIndex) {
        try {
        return makeSubstring.substring(startIndex, endIndex);
        }
        catch (IndexOutOfBoundsException e) {
            return "Invalid command";
        }
    }


}
