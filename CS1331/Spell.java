
/**
*this is the Spell class which creates Spell objects
*@author Azha Qari
*@version 1.0
*/
public class Spell {

    protected String name;
    protected int damage;
/**
*sets the name of the spell and the damage
*@param name the spell name
*@param damage the spell damage
*/
    public Spell(String name, int damage) {

        this.name = name;
        this.damage = damage;
    }
/**
*gets the damage
*@return returns the int damage
*/
    public int getAbilityPower() {
        return damage;
    }
/**
*gets the name
*@return returns the spell name
*/
    public String getName() {
        return name;
    }
/**
*checks if the name and the damage of the spells are the same
*@param other for the spell to be compared
*@return returns a boolean value depending on how the logic executes
*/
    public boolean equals(Spell other) {
        if (name.equals(other.name) && damage == other.damage) {
            return true;
        }
        return false;
    }
/**
*toString method that displays the spell specifications
*@return a string that displays the name and power of a spell
*/
    public String toString() {
        return name + ": " + damage + " attack power";
    }
}
