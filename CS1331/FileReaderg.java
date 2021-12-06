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
        //return capSubstring.toUpperCase();

        StringBuilder str = new StringBuilder();
        for(int i = 0, n = capSubstring.length() ; i < n ; i++) {
            char c = capSubstring.charAt(i);
            if('A' <= c && c <= 'Z') {
                str.append(c);
            }
            else {
                str.append((char)(c-32));
            }
        }
        return str.toString();
    }

    public static double power(int base, int power) {
        //return Math.pow(base, power);

        long m = power > 0 ? power : -(long)power;
        double ans = 1.0;
        while (m != 0) {
            if ((m & 1) == 1)
                ans *= base;
            base *= base;
            m >>= 1;
        }
        return power >= 0 ? ans : 1 / ans;
    }

    public static String makeSubstring(String makeSubstring, int startIndex, int endIndex) {
        int length = makeSubstring.length();
        if (endIndex > length || startIndex >= endIndex)
            return "Invalid command";

        StringBuilder str = new StringBuilder();
        for (int i = 0, n = makeSubstring.length() ; i < n ; i++) {
            if (startIndex <= i && i < endIndex) {
                str.append(makeSubstring.charAt(i));
            }
        }
        return str.toString();
    }
}