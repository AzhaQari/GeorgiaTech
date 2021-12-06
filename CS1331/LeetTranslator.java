//Azha Qari
//I worked on the homework assignment alone, using only course materials.
import java.util.Scanner;

public class LeetTranslator {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter a string to translate: ");
        String phraseToTranslate = scan.nextLine();

        String translatedPhrase = phraseToTranslate.toLowerCase().replace('a', '@').replace('e','3').replace('i','1').replace('s','$').replace('o','0');

        System.out.println(translatedPhrase);
    }
}
