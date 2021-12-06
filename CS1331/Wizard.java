//I worked on this homework alone using only course resources

import java.util.Random;

/**
*this is the Wizard class for creating Wizard objects
*@author Azha Qari
*@version 1.0
*/
public class Wizard {
    protected String name;
    protected int health;
    protected int maxHealth;
    protected int attackPower;
    protected String favoriteColor;
    private static Spell[] spellBook = new Spell[]{new Spell("Wingardium Leviosa", 0)};

    //all parameters
    /**
    *Constructor that creates the wizard object using all the parameters
    *@param name this wizards name
    *@param maxHealth this wizards max health
    *@param attackPower this wizards attack power
    *@param favoriteColor this wizards favorite color/represents house at hogwarts
    *@param spellBook wizards spells in an array
    */
    public Wizard(String name, int maxHealth, int attackPower, String favoriteColor, Spell[] spellBook) {
        this.name = name;
        this.health = maxHealth;
        this.maxHealth = maxHealth;
        this.attackPower = attackPower;
        this.favoriteColor = favoriteColor;
        this.spellBook = spellBook;
    }
    //missing maxHealth
    /**
    *Constructor that creates the wizard object using all the parameters except maxHealth
    *@param name this wizards name
    *@param attackPower this wizards attack power
    *@param favoriteColor this wizards favorite color/represents house at hogwarts
    *@param spellBook wizards spells in an array
    */
    public Wizard(String name, int attackPower, String favoriteColor, Spell[] spellBook) {
        this.name = name;
        this.health = 25;
        this.maxHealth = 25;
        this.attackPower = attackPower;
        this.favoriteColor = favoriteColor;
        this.spellBook = spellBook;
    }
    //missing spellBook
    /**
    *Constructor that creates the wizard object using all the parameters except spellBook
    *@param name this wizards name
    *@param maxHealth this wizards max health
    *@param attackPower this wizards attack power
    *@param favoriteColor this wizards favorite color/represents house at hogwarts
    */
    public Wizard(String name, int maxHealth, int attackPower, String favoriteColor) {
        this.name = name;
        this.health = maxHealth;
        this.maxHealth = maxHealth;
        this.attackPower = attackPower;
        this.favoriteColor = favoriteColor;
        //spellBook.add(new Spell("Wingardium Leviosa", 0));
    }
    //missing maxHealth and spellBook
    //all parameters
    /**
    *Constructor that creates the wizard object using all the parameters except spellBook and maxHealth
    *@param name this wizards name
    *@param attackPower this wizards attack power
    *@param favoriteColor this wizards favorite color/represents house at hogwarts
    */
    public Wizard(String name, int attackPower, String favoriteColor) {
        this.name = name;
        this.health = maxHealth;
        this.maxHealth = 25;
        this.attackPower = attackPower;
        this.favoriteColor = favoriteColor;
        //spellBook.add(new Spell("Wingardium Leviosa", 0));
    }
/**
*sets the name
*@param name the wizards name
*/
    public void setName(String name) {
        this.name = name;
    }
/**
*sets the health
*@param health the wizards health
*/
    public void setHealth(int health) {
        this.health = health;
    }
/**
*sets the maxHealth
*@param maxHealth the wizards max health
*/
    public void setMaxHealth(int maxHealth) {
        this.maxHealth = maxHealth;
    }
/**
*sets the attackPower
*@param attackPower the power of the wizards attack
*/
    public void setAttackPower(int attackPower) {
        this.attackPower = attackPower;
    }
/**
*sets the favorite color
*@param favoriteColor wizards favorite color
*/
    public void setFavoriteColor(String favoriteColor) {
        this.favoriteColor = favoriteColor;
    }
/**
*sets the spell book
*@param spellBook array of the spells the wizard has
*/
    public void setSpellBook(Spell[] spellBook) {
        this.spellBook = spellBook;
    }
/**
*goes through the spell book and returns a string of the spells in spellList
*@return returns the spellList
*/
    public String printSpellBook() {
        String spellList = "";
        for (int i = 0; i < this.spellBook.length; i++) {
            spellList += spellBook[i].toString() + "\n";
        }
        return spellList;
    }
/**
*toString method that visualizes the wizard
*@return returns a statement saying which house the wizard wants to join with
*respect to the wizards favorite color
*/
    public String toString() {
        return name + " wishes to join the " + favoriteColor + " house at Hogwarts! They have "
             + health + " health points and " + attackPower + " attack power.";
    }
/**
*creates a friendly interaction between the two wizards before they duel
*/
    void interact(Wizard other) {
        System.out.println(name + ": Hey " + other.name + ", let's be friends!");
        duel(other);
    }
/**
*determines which house the opponent is in and also initiates and runs through the duel
*/
    void duel(Wizard opponent) {

        String house, oppHouse;
        if (this.favoriteColor.equals("scarlet")) {
            house = "Gryffindor";
        } else {
            house = "Slytherin";
        }

        if (opponent.favoriteColor.equals("scarlet")) {
            oppHouse = "Gryffindor";
        } else {
            oppHouse = "Slytherin";
        }

        System.out.println(name + " is a " + house + " with " + health + " health, " + attackPower + " attack power");

        System.out.println(opponent.name + " is a " + oppHouse + " with " + opponent.health + " health, " + opponent.attackPower + " attack power");

        while (this.health > 0 && opponent.health > 0) {
            if (this.health > opponent.health) {
                this.cast(opponent);
            } else {
                opponent.cast(this);
            }

            if (this.health > opponent.health) {
                runDrinkChance(opponent);
            } else if (opponent.health > this.health) {
                runDrinkChance(this);
            }

        }

        if (this.health == 0) {
            System.out.println(this.name + " falls to the ground. " + opponent.name + " wins the duel!");
        } else {
            System.out.println(opponent.name + " falls to the ground. " + this.name + " wins the duel!");
        }

        this.health = maxHealth;
        opponent.setHealth(opponent.maxHealth);


    }
/**
*determines whether or not the weaker wizard will get an additional 3 health based off chance
*/
    void runDrinkChance(Wizard wiz) {
        Random rand = new Random();
        double drinkChance = rand.nextDouble();
        if (drinkChance <= 0.2) {
            if (wiz.health + 3 <= wiz.maxHealth) {
                wiz.health += 3;
                System.out.println(wiz.name + " drinks an invigoration potion and restores 3 health! " + wiz.name + " now has " + wiz.health + " health.");
            } else {
                wiz.health = wiz.maxHealth;
                System.out.println(wiz.name + " drinks an invigoration potion and restores health back to " + wiz.health);
            }

        }

    }
/**
*determines how the defender will be affected/will react by/to the attack, depending on who has less health
*/
    void cast(Wizard defender) {
        Spell castSpell = this.getRandomElement(this.spellBook);
        int damage = castSpell.getAbilityPower();
        defender.setHealth(defender.health - damage - this.attackPower);
        if (defender.health < 0) {
            defender.setHealth(0);
        }
        System.out.println(this.name + " casts " + castSpell.getName() + " and deals " + damage + " damage. " + defender.name + " now has " + defender.health + " health.");
    }
/**
*gets a random element for arr
*@param arr a array of the spells
*@return the value of array of arr at a certain location
*/
    public Spell getRandomElement(Spell[] arr) {
        Random rand = new Random();
        return arr[rand.nextInt(arr.length)];
    }
/**
*the equals() works to check if the name, health, power, and spells are the same for a wizard
*@param other the other wizard
*@return returns a boolean value depending on how the logic executes
*/
    public boolean equals(Wizard other) {
        if (this.name.equals(other.name) && this.maxHealth == other.maxHealth && this.attackPower == other.attackPower && this.spellBook.equals(other.spellBook)) {
            return true;
        }
        return false;
    }
/**
*the equals() works to check if the name, health, power, and spells are the same for a wizard
*@param other the other wizard
*@return returns a boolean value depending on how the logic executes
*/
    public boolean equals(Slytherin other) {
        if (this.name.equals(other.name) && this.maxHealth == other.maxHealth && this.attackPower == other.attackPower && this.spellBook.equals(other.spellBook)) {
            return true;
        }
        return false;
    }
/**
*the equals() works to check if the name, health, power, and spells are the same for a wizard
*@param other the other wizard
*@return returns a boolean value depending on how the logic executes
*/
    public boolean equals(Gryffindor other) {
        if (this.name.equals(other.name) && this.maxHealth == other.maxHealth && this.attackPower == other.attackPower && this.spellBook.equals(other.spellBook)) {
            return true;
        }
        return false;
    }


}
