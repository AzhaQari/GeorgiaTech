import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class PoemReader {

    /*
        Do not modify the "throws FileNotFoundException" in the method headers!

        You don't have to worry about exceptions for now, but removing this
        statement from the headers will make your code not compile.
     */

    public static void printFile(File file) throws FileNotFoundException {
        System.out.print("lease enter a file path: ");
        Scanner sc = new Scanner(File);
        while(sc.hasNextLine()) {
            String line = sc.nextLine();
            System.out.println(line);
        }

    }

    public static int wordCount(File file, String word)
        throws FileNotFoundException {
    }

    public static int findLastOccurrence(File file, String word)
        throws FileNotFoundException {
            // Assume that the first line in the file is 'Line 0'
    }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner input = new Scanner(System.in);
        System.out.println("File Location");
        String fileLocation = input.nextLine();
        File file = new File(fileLocation);
        printfile(File);
        // The filename should be passed as an argument in the command line

        /*

        Testing:

        1) Try printing the file using the printFile method
        2) Try counting how many times the word "time" appears. Should be 4
        3) Try checking the last line the word "time" appears. Should be line 34

        */
    }

}
