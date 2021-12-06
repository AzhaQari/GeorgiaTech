


public class Test {

    public static void main(String[] args) {
        System.out.println(quarantine("BlueJeans"));
    }



}

public static String quarantine(String s) {
    int n = s.length();
    if (n==1) {
        return s;
    } else {
        n--;
        return s.substring(n, n+1) + quarantine(s.substring(0,n));
    }
}
