import java.io.IOException;
import java.net.URL;
import java.util.Scanner;

public class WebScraper {
    public static void main(String[] args) throws IOException {
        String address = "http://reddit.com";
        URL pageLocation = new URL(address);
        Scanner in = new Scanner(pageLocation.openStream());

        while(in.hasNext()) {
            String line = in.next();
            if (line.contains("href-\"http://")) {
                int from = line.indexOf("\"");
                int to = line.lastIndexOf("\"");
                System.out.println(line.substring(from + 1, to));
            }
        }
    }
}
