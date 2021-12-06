//I did this homework alone, using only class materials and office hours
/**
* @author Azha Qari
* @version 1.0
*/

public abstract class Adventurer {

    protected String name;
    protected int power;
    protected int health;
    /**
    *default constructor.
    */
    public Adventurer() {
    }
    /**
    * Constructor that takes in a name, health value, and attack level.
    * @param name the name of the Object.
    * @param health the health of the Object.
    * @param power the power level of the object.
    */
    public Adventurer(String name, int health, int power) {
        this.name = name;
        this.health = health;
        this.power = power;
    }
    /**
    * Abstract method that indicates unique attack methods will be needed in subclass.
    * @param a It's a passed in Adventurer object.
    */
    public abstract void attack(Adventurer a);
    /**
    * Method that adds health to Adventurer when they drink a potion.
    */
    public void drinkPotion() {
        if (health >= 0) {
            this.health += 15;
        }
    }
    /**
    * Equals method that tests if two Adventurers are equal.
    * @param o The object passed in to be compared to the object calling the equals method.
    * @return Returns a boolean true or false dependent on if the objects are equal.
    */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Adventurer)) {
            return false;
        }
        Adventurer a = (Adventurer) o;
        return (a.name.equals(name) && a.health == health && a.power == power);
    }
    /**
    * toString for the parent Adventurer class to print out the proper statement.
    * @return Returns the proper string for the Adventurer.
    */
    public String toString() {
        return "Name: " + name + ", Health: " + health + ", Attack: " + power;
    }

    //GETTERS & SETTERS:        (None for name!)    I commented them out bc i used protected variables

    //public static void setPower(Adventurer a) {
    //    power = a.power;
    //}
    /*
    public void setPower(int a) {
        this.power = a;
    }
    public int getPower() {
        return this.power;
    }


    public void setHealth(Adventurer a) {
        health = a.health;
    }

    public void setHealth(int a) {
        this.health = a;
    }

    public int getHealth() {
        return this.health;
    }
    */
}
