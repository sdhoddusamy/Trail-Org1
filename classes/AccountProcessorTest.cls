@isTest
public class AccountProcessorTest {
    @isTest
    public static void testAccountWithContacts(){
        List<Id> idList = new List<Id>();
        Account a = new Account(Name='test 1');
        insert a;
        Account insacc = [Select Id, Number_Of_Contacts__c FROM Account Where Id = :a.Id];
        Contact c = new Contact(FirstName='Test', LastName='Test', AccountId = insacc.Id);
        insert c;
        
        
        System.assertEquals(null,insacc.Number_Of_Contacts__c, 'Incorrect number of contacts');
        idList.add(a.Id);
        Test.startTest();
          AccountProcessor.countContacts(idList);  
        Test.stopTest();
        
        Account updAcc = [Select Id, Number_Of_Contacts__c FROM Account Where id = : a.Id];
         System.assertEquals(1,updAcc.Number_Of_Contacts__c, 'Incorrect number of contacts');
    }
}