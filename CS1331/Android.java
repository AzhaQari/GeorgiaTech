//I worked on this assignment alone using only course materials
/**
 * This file contains the Android class.  You will need to implement many
 * methods, variables, and a constructor in this class.
 *
 * Since this class is actually a subclass of Human, its rank and name actually exist as instance variables in the
 * superclass!  No instance variables need be declared in this class.
 *
 * It should also have a constructor that takes in String name and int rank.  Rather than assigning these values
 * to instance variables, since we don't have access to them, use the `super` keyword to call the superclass
 * constructor, the constructor in the Human class, with the appropriate parameters.
 *
 * It should also have a second constructor that takes no arguments.  This constructor should use constructor chaining
 * to call the other one with arguments "Data" as the name and 2 as the rank.
 *
 * You should also implement the overridden method boolean isPrime(int num) from the Logic interface.
 * You can assume num >= 1.
 *      It should work as follows:
 *         - If num is 1, return false
 *         - If num is 2 or 3, return true
 *         - Otherwise, obtain the square root of num.  If this value is not a whole number, call Math.ceil() on it.
 *           Then, cast it to an integer.  Let this value be called "sqrt". Return false if any of the numbers between 2
 *           and sqrt, inclusive, divide evenly into num.  That is, if any of num % 2, num % 3, ..., num % sqrt are 0.
 *           Otherwise, return true.
 *
 * You should create an additional overloaded method boolean isPrime(int num1, int num2, int num3)
 * This should return true only if num1, num2, and num3 are *all* prime according to the isPrime() method in this class.
 * Otherwise, return false.
 *
 * Additionally, the Android class will implement 1 overridden method from java.lang.Object.
 *  For the overridden method public String toString(), what should be returned is the String
 *  "Android [superString]", where superString is the value returned by calling toString() from the superclass.
 *  You will need a special keyword in order to reference the superclass' toString() method.
 *
 * @author Azha Qari
 * @version 1.0
 */
public class Android extends Human implements Logic {
    /**
    *@param name the androids name
    *@param rank the androids rank
    */
    public Android(String name, int rank) {
        super(name, rank);
    }
    /**
    *overloaded class that provides values for the two parameters when none are given
    */
    public Android() {
        this("Data", 2);
    }
    /**
    *@param num a number
    *@return returns true if the number is prime, false otherwise
    */
    @Override
    public boolean isPrime(int num) {
        if (num == 1) {
            return false;
        }
        if (num == 2 || num == 3) {
            return true;
        } else {
            double root = Math.ceil(Math.sqrt(num));
            int sqrt = (int) root;
            for (int i = 2; i < sqrt + 1; i++) {
                if (num % i == 0) {
                    return false;
                }
            }
            return true;
        }
    }
    /**
    *@param num1 a number
    *@param num2 a second number
    *@param num3 a third number
    *@return returns true if all are prime, false otherwise
    */
    public boolean isPrime(int num1, int num2, int num3) {
        return isPrime(num1) && isPrime(num2) && isPrime(num3);
    }
    /**
    *@return returns the toString
    */
    public String toString() {
        return "Android " + super.toString();
    }

}
