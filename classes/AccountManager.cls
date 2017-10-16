@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substringBetween('/Accounts/','/contacts');
        System.debug('Return String: '+accId);
        Account acc = [Select Id, Name, (Select Id, Name FROM Contacts) From Account Where Id=: accId];
        return acc;
    }
}