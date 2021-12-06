/**
* @author Azha Qari
* @version 1.0
*/
abstract class Treatment implements HealAbility {
    private int heal;
    Treatment(int h) {
        this.heal = h;
    }

    @Override
    public String toString() {
        return "Treatment with " + heal + " heal";
    }

    public int getHealAmount() {
        return heal;
    }
}
