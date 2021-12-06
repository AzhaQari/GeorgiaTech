//Azha Qari
//I did not collaborate with anyone on this assignment
import java.util.Random;

public class DataLeakSimulator {
    public static SchoolDataType leakData(int num) {
        int x = Math.abs(num);
        x %= 4;
        if (x == 0) {
            return SchoolDataType.STUDENTS;
        } else if (x == 1) {
            return SchoolDataType.CLASSES;
        } else if (x == 2) {
            return SchoolDataType.HOUSING;
        } else {
            return SchoolDataType.DINING;
        }
    }

    public static void main(String[] args) {
        Random myRandom = new Random();
        int randomNum;
        randomNum = myRandom.nextInt(26);
        randomNum = (int) Math.sqrt(randomNum);
        int randomNum2 = (int) (Math.random() * ((10 + 10) + 1) - 10);

        SchoolDataType x = leakData(randomNum);
        System.out.println(x + " data was leaked");
        SchoolDataType y = leakData(randomNum2);
        System.out.println(y + " data was leaked");
    }
}
