public class MyCalc {
    public static void main(String[]args){
        int myInt = Integer.parseInt(args[0]);
        System.out.println("the number is " + myInt);
        System.out.println("the number is " + (myInt++));
        System.out.println("the number is " + (++myInt));


        System.out.println("the result is " + (double)(myInt/2));
        System.out.println("the double is " + (double) myInt);
    }
}
