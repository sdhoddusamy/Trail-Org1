@isTest
public class AnimalLocatorTest {
	@isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        
        String aniName = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        
        System.assertEquals('chicken', aniName);
        
    }
}