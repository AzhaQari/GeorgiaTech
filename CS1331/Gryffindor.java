import java.util.Random;

/**
*this is the Gryffindor class which extends wizard and creates Gryffindor objects
*@author Azha Qari
*@version 1.0
*/
public class Gryffindor extends Wizard {

    protected Random random = new Random();
    protected int maxHealth = 25 + random.nextInt(6);
    protected int attackPower = 4 + random.nextInt(3);
    protected String favoriteColor = "scarlet";
    protected Spell[] spellBook = new Spell[]{
        new Spell("Expecto Patronum", 3),
        new Spell("Expelliarmus", 2),
        new Spell("Ridikkulus", 1),
        new Spell("Wingardium Leviosa", 0)
    };

/**
*sets all the needed values for the Gryffindor wizard when a name is given
*@param name the wizards name
*/
    public Gryffindor(String name) {
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
*the equals() works to check if values are the same for a wizard
*@return returns a boolean value depending on how the logic executes
*@param other the other wizard
*/
    public boolean equals(Gryffindor other) {
        return super.equals(other);
    }


}
