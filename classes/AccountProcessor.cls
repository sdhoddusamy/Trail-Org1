public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accIds){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Number_Of_Contacts__c, (Select Id FROM Contacts) From Account Where Id IN : accIds];
        for(Account acc: accList){
            System.debug(acc.Contacts.size());
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }    
        update accList;
    }
}