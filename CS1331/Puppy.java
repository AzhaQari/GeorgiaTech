//I worked on this assignment alone, using only the curse materials

import java.util.Random;

/**
* this class represents the puppy object
*@author Azha Qari
*@version 1.0
*/

public class Puppy {
    private String name;
    private int age;
    private int health;
    private static Random randomNumbers = new Random();

/**
*this constructor creates Puppy w/ a name, age, and health rating
*@param name the name
*@param age the age
*@param health the health rating
*/
    public Puppy(String name, int age, int health) {
        this.name = name;
        this.age = age;
        this.health = health;
    }

/**
*this constructor creates Puppy w/ a name
*@param name the puppys name
*/
    public Puppy(String name) {
        this(name, randomNumbers.nextInt(16), randomNumbers.nextInt(31) + 5);
    }
/**
*setter for the name of the puppy
*@param name the name
*/
    public void setName(String name) {
        this.name = name;
    }
/**
*getter for the puppys name
*@return returns the puppys name
*/
    public String getName() {
        return name;
    }
/**
*setter for the age
*@param age the puppys age
*/
    public void setAge(int age) {
        this.age = age;
    }
/**
*getter for the age
*@return the age of the pupper
*/
    public int getAge() {
        return age;
    }
/**
*setter for the health
*@param health is the numeric value for the puppers health
*/
    public void setHealth(int health) {
        this.age = health;
    }
/**
*getter for the puppys health
*@return returns the numberic value for the puppys health
*/
    public int getHealth() {
        return health;
    }
/**
*gives a description of the puppy
*@return returns a string description
*/
    public String toString() {
        return name + ": a puppy " + age + " years old with " + health + " health";
    }
/**
*determines if the puppy is adobtable
*@return true if it is adoptable, false if not
*/
    public boolean canAdopt() {
        return health >= 50;
    }
/**
*increments health by 1
*/
    public void fetch() {
        health++;
    }
/**
*determines how to increment the dogs health
*@param inside a boolean that states whether fetch was inside or outside
*/
    public void fetch(boolean inside) {

        if (inside) {
            health += 5;
        } else {
            health += 10;
        }
    }
/**
*increments health based on the distance fetch was played
*@param distance is the distance the object was thrown
*/
    public void fetch(int distance) {
        health += (distance / 10);
    }

}
