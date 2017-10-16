@isTest
private class AccountManagerTest {
    
    @isTest static void testAccountManager(){
        Account acc = new Account(Name='Test Acc');
        insert acc;
        
        Contact c = new Contact(FirstNAme='FirstName', LastName='LastName', AccountId=acc.id);
        insert c;
        RestRequest request = new RestRequest();
        request.requestURI = 'https://brave-goat-72639-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+acc.Id+'/contacts';
        request.httpMethod='GET';
        RestContext.request = request;
        
        Account retAcc = AccountManager.getAccount();
        System.assert(retAcc != null);
        System.assertEquals(1, retAcc.contacts.size());
    }
}