/*
public class AgeCalculator {
    public static void main(String[] args) {
    // Do not modify the following line.
    int birthYear = Integer.parseInt(args[0]);
    // Part 1:
    int age = 2019 - birthYear;
    // Part 2:
    System.out.println("This person is " + age + " years old!");
    }
}
*/

public class AgeCalculator {
    public static void main(String[] args) {
        int age;
        int birthYear = Integer.parseInt(args[0]);
        age = 2020 - birthYear;
        System.out.println("You are " + age + " years old!");
    }
}
