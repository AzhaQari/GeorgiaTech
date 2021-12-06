import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReader {

    public static void main(String[] args) throws FileNotFoundException {
    	File commandsFile = new File(args[0]);
        Scanner fileScanner = new Scanner(commandsFile);

        while (fileScanner.hasNext()) {
            String text = fileScanner.nextLine();

            words = text.split()

            if words[0].equals("substring") {
                String str = words[0];
                int startIndex = Integer.parseInt(words[1]);
                int endIndex = Integer.parseInt(words[2]);
                result = makeSubstring(str, startIndex, endIndex);
                System.out.println(result);
            }

            if words[0].equals("allcaps") {
            	capSubstring = words[0];
                result = allCaps(capSubstring);
                System.out.println(result);
            }

            if (text.contains("power")) {
                int base = Integer.parseInt(words[1]);
                int power = Integer.parseInt(words[2]);
                result = power(base, power);
                System.out.println("%f", result);
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
