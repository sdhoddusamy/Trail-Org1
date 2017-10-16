@isTest
public class LeadProcessorTest {

    @isTest
    public static void testLeadBatch(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=1; i<= 200; i++){
            leads.add(new Lead(FirstName='First', LastName='Last', Company='Company'));
        }
        insert leads;
        
        Test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [Select count() FROM Lead Where LeadSource = 'Dreamforce']);
    }
}