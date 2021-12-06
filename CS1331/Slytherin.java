import java.util.Random;
/**
*this is the Slytherin class which extends wizard and creates Slytherin objects
*@author Azha Qari
*@version 1.0
*/
public class Slytherin extends Wizard {

    protected Random random = new Random();
    protected int maxHealth = 22 + random.nextInt(6);
    protected int attackPower = 5 + random.nextInt(3);
    protected String favoriteColor = "green";
    protected Spell[] spellBook = new Spell[]{
        new Spell("Expulso", 3),
        new Spell("Levicorpus", 2),
        new Spell("Oppugno", 1),
        new Spell("Flipendo", 1),
        new Spell("Wingardium Leviosa", 0)
    };
/**
*sets all the needed values for the Slytherin wizard when a name is given
*@param name the wizards name
*/
    public Slytherin(String name) {
        super("name", 0, "color");
        super.setName(name);
        super.setHealth(maxHealth);
        super.setMaxHealth(maxHealth);
        super.setAttackPower(attackPower);
        super.setFavoriteColor(favoriteColor);
        super.setSpellBook(spellBook);
        //super(name, maxHealth, attackPower, favoriteColor, spellBook);
    }

/**
*this toString is set up to run the toString from Wizard.java
*@return super.toString() from Wizard.java
*/
    public String toString() {
        return super.toString();
    }
/**
*the equals() works to check if the name, health, power, and spells are the same for a wizard
*@param other the other wizard
*@return returns a boolean value depending on how the logic executes
*/
    public boolean equals(Slytherin other) {
        return super.equals(other);
    }
}
