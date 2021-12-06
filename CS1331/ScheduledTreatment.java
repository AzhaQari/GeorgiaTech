/**
* @author Azha Qari
* @version 1.0
*/
public class ScheduledTreatment extends Treatment {
    private int treatPatientID;

    /**
    * Constructor for ScheduledTreatment that takes in 2 parameters.
    * @param x the number to set health to.
    * @param y the number ot set treatPatientID to.
    */
    public ScheduledTreatment(int x, int y) {
        super(x);
        this.treatPatientID = y;
    }

    @Override
    public void performHeal(Patient[] p) {
        if (p.length == 0) {
            return;
        }
        HealAbility.sortPatients(p);
        int l = 0;
        int r = p.length - 1;
        int middle = (l + r) / 2;
        while (l <= r) {
            if (treatPatientID < p[middle].getPatientID()) {
                r = middle - 1;
                middle = (r + l) / 2;

            } else if (treatPatientID > p[middle].getPatientID()) {
                l = middle + 1;
                middle = (l + r) / 2;
            } else if (p[middle].getPatientID() == treatPatientID) {
                p[middle].increaseHealth(this);
                break;
            }
        }
    }
}
