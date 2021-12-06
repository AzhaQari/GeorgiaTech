import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReader {

    public static void main(String[] args) throws FileNotFoundException {
    	File commandsFile = new File(args[0]);
        Scanner fileScanner = new Scanner(commandsFile);

        while (fileScanner.hasNext()) {
            String text = fileScanner.nextLine();

            String[] words = text.split(" ");

            if(words[0].equals("substring")) {
                String str = words[1];
                int startIndex = Integer.parseInt(words[2]);
                int endIndex = Integer.parseInt(words[3]);
                String result = makeSubstring(str, startIndex, endIndex);
                System.out.println(result);
            }

            if(words[0].equals("allcaps")){
            	String capSubstring = words[1];
                String result = allCaps(capSubstring);
                System.out.println(result);
            }

            if(words[0].equals("power")){
                int base = Integer.parseInt(words[1]);
                int power = Integer.parseInt(words[2]);
                double result = power(base, power);
                System.out.println(result);
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