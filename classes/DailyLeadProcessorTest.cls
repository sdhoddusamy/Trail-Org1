@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 23 * * ? * ';
    
	@TestSetup
    static void setup(){
        List<Lead> listLead = new List<Lead>();
        for(Integer i=1; i<=200; i++){
            listLead.add(new Lead(FirstName='Test', LastName='Test', Company='Test'));
        }
        insert listLead;
    } 
    
    @isTest
    public static void testDailyLead(){
        
        Test.startTest();
        DailyLeadProcessor DLP = new DailyLeadProcessor();
        System.schedule('Daily Lead Process', CRON_EXP, DLP);
        System.assertEquals(0, [Select count() From Lead Where LeadSource='Dreamforce']);
        Test.stopTest();
        
        System.assertEquals(200, [Select count() From Lead Where LeadSource='Dreamforce']);
    }
}