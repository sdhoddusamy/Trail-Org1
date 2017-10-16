@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup(){
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<=50; i++){
            accList.add(new Account(Name='NY Account '+i, BillingState= 'NY'));
        }
        for(Integer j=1; j<=50; j++){
            accList.add(new Account(Name='CA Accounts '+j, BillingState= 'CA'));
        }
        insert accList; 
    }
     
    @isTest
    public static void testPrimaryContact(){
        Contact c = new Contact(FirstName='First', LastName='Last');
        
        AddPrimaryContact PC1 = new AddPrimaryContact(c, 'NY');
        AddPrimaryContact PC2 = new AddPrimaryContact(c, 'CA');
        Test.startTest();
        	System.enqueueJob(PC1);
        	System.enqueueJob(PC2);
        Test.stopTest();
        
        System.assertEquals(100, [Select count() FROM Contact]);
    }
}