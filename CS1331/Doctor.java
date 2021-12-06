/**
 * Represents a Doctor object with a certain name, 2 treatment objects,
 * and methods that act on those Treatment objects.
 * @author (your name here)
 * @version 1.0
 */
public class Doctor {
    private String name;
    private Treatment treatment;
    /**
     * Initialies a Doctor object with the given name and 1 additional
     * parameter.
     *
     * After creating the EmergencyTreatment class, and creating an instance variable
     * of type Treatment above, in this constructor you should initialize an
     * instance of the **EmergencyTreatment** class, whose constructor will take
     * in the value of `emergencyHealAmount` This new object should be assigned
     * to an instance variable in this class.
     * @param  name                 the name of this doctor
     * @param  emergencyHealAmount  the amount of health points to pass in to the
     *                              EmergencyTreatment constructor
     */
    public Doctor(String name, int emergencyHealAmount) {
        this.name = name;
        this.treatment = new EmergencyTreatment(emergencyHealAmount);
    }

    /**
     * Initialies a Doctor object with the given name, and takes in 2 additional
     * parameters.
     *
     * After creating the ScheduledTreatment class, and creating an instance variable
     * of type Treatment above, in this constructor you should initialize an
     * instance of the **ScheduledTreatment** class, whose constructor will take
     * in the value of `scheduledHealAmount` as well as `scheduledPatientID`.
     * This new object should be assigned to an instance variable in this class.
     * @param  name                 the name of this doctor
     * @param  scheduledHealAmount  the amount of health points to pass in to the
     *                              ScheduledTreatment constructor
     * @param  scheduledPatientID   the patientID to pass in to the
     *                              ScheduledTreatment constructor
     */
    public Doctor(String name, int scheduledHealAmount, int scheduledPatientID) {
        this.name = name;
        this.treatment = new ScheduledTreatment(scheduledHealAmount, scheduledPatientID);
    }
    /**
    * Method to perform treatment on a patient.
    * @param p is a Patient array with Patient objects.
    */
    public void performTreatment(Patient[] p) {
        System.out.println(this.name + " goes to heal their patients!");
        treatment.performHeal(p);
    }

    @Override
    public String toString() {
        return String.format(
            "Doctor %s with treatment %s",
            name, treatment.toString()
        );
    }
}
