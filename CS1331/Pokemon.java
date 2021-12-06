import java.util.ArrayList;
abstract public class Pokemon {
    private ArrayList<Integer> medicalHistory;
    private String trainerName;
    private int health;
    private int maxHealth;
    public Pokemon(String trainerName, int health, int maxHealth) {
        this.trainerName = trainerName;
        this.health = health;
        this.maxHealth = maxHealth;
        medicalHistory = new ArrayList<Integer>();
    }
    public Pokemon(Pokemon p) {
        this.trainerName = p.trainerName;
        this.health = p.health;
        this.maxHealth = p.maxHealth;
        medicalHistory = p.medicalHistory;
    }
    public void heal(int amount) {
        if ((health + amount) <= maxHealth) {
            health += amount;
            medicalHistory.add(amount);
        } else {
            health = maxHealth;
            medicalHistory.add(maxHealth - health);
        }
    }
    public void damage(int amount) {
        if (health >= amount) {
            health -= amount;
            medicalHistory.add(-1 * amount);
        } else {
            health = 0;
            medicalHistory.add(-1 * health);
        }
    }
    public int compareTo(Pokemon other) {
        if (health == other.health) {
            return 0;
        } else if (health > other.health) {
            return 1;
        } else {
            return -1;
        }
    }
    public boolean equals(Object other) {
        if (health == other.health && maxHealth == other.maxHealth) {
            if (trainerName.compareTo(other.trainerName) == 0) {
                if (medicalHistory.equals(other.medicalHistory)) {
                    return true;
                }
            }
        } else {
            return false;
        }
    }
    public String getTrainerName() {
        return trainerName;
    }
    public int getHealth() {
        return health;
    }
    public int getMaxHealth() {
        return maxHealth;
    }
    public void setTrainerName(String name) {
        trainerName = name;
    }
}
