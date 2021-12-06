package farming;

import org.junit.Test;

import static org.junit.Assert.*;

public class PetRockTest {
    private PetRock rocky = new PetRock("Rocky");

    @Test
    public void getName() {
        assertEquals("Rocky", rocky.getName());
    }

    @Test
    public void testUnhappyToStart() throws Exception {
        assertFalse(rocky.isHappy());
    }

    @Test
    public void testHappyAfterPlay() {
        rocky.playWithRock();
        assertTrue(rocky.isHappy());
    }
}