/**
 * This file contains the Human class.  You will need to implement many
 * methods, variables, and a constructor in this class.
 *
 * This class should have exactly 2 instance variables, a String name, and an int rank.
 * name should never be able to be changed once initialized in the constructor.  What keyword would allow us to do this?
 *
 * It should also have exactly one constructor, which takes in String name and int rank.
 * It should assign name to its corresponding instance variable.
 * However, we must get the Rank enum value corresponding to int rank.  A rank = 0 corresponds to Rank.ENSIGN,
 * rank = 1 to Rank.LIEUTENANT, and so on.  Note that we can only obtain a valid rank if 0 <= rank <= 5.
 * So, if `int rank` is negative or greater than 5, initialize `Rank rank` to null.
 * Otherwise, obtain the corresponding enum rank using Rank.values().
 *
 * It should also properly implement the getName() and getRank() methods from Officer.
 * Each of these should return its corresponding local instance variable.
 *
 * Additionally, the Human class will implement 2 overridden methods from java.lang.Object.
 * For the overridden method public String toString(), what should be returned is the String
 * "[rankString] [name]", where rankString is the value returned by the interface method rankString()
 * from Officer and where name is the local instance variable name.
 *
 * For the overridden method public boolean equals(Object other), follow the following formula:
 *        First, check if other == this.  If it does, return true.
 *        Next, check if other instanceof Human is false.  If it is false, return false.
 *        Otherwise, cast other to a Human, and return true if its name and rank are equal
 *        to the name and rank of the current object.
 *
 * @author Azha Qari
 * @version 1.0
 */
public class Human implements Officer {
    private final String name;
    private Rank rank;
    /**
    *@param name the humans name
    *@param rank the humans rank
    */
    public Human(String name, int rank) {
        this.name = name;
        if (rank >= 0 && rank <= 5) {
            this.rank = Rank.values()[rank];
        } else {
            this.rank = null;
        }
    }
    /**
    *@return returns the name
    */
    public String getName() {
        return name;
    }
    /**
    *@return returns rank
    */
    public Rank getRank() {
        return rank;
    }
    /**
    *@return returns the toString
    */
    @Override
    public String toString() {
        return rankString() + " " + name;
    }
    /**
    *@param other other object
    *@return returns true if theyre equal and false if the other object is null
    */
    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (other == null) {
            return false;
        } else {
            Human obj = (Human) other;
            return this.rank == obj.rank && this.name == obj.name;
        }
    }

}
