/**
* @author Azha Qari
* @version 1.0
*/
public class EmergencyTreatment extends Treatment {
    /**
    * Method to set the health to a passed in parameter.
    * @param h is the number they want to set the health to.
    */
    public EmergencyTreatment(int h) {
        super(h);
    }

    @Override
    public void performHeal(Patient[] p) {
        Patient pat;
        int x = 0;
        int y = 0;

        if (p.length == 0) {
            return;
        }

        x = p[0].getHealth();
        pat = p[0];
        for (int i = 0; i < p.length; i++) {
            if (p[i].getHealth() < x) {
                x = p[i].getHealth();
                pat = p[i];
            }
        }
        pat.increaseHealth(this);
    }
}
