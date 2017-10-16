public class AddPrimaryContact implements Queueable{
    Contact con;
    String state;
    public AddPrimaryContact(Contact con, String state){
    	this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext qc){
        List<Contact> conList = new List<Contact>();
        List<Account> acc = [SELECT Id, BillingState FROM Account WHERE BillingState =: state LIMIT 200];
        for(Account ac: acc){
            Contact aCon = con.clone(false);
            aCon.AccountId = ac.id;
           conList.add(aCon);
        }
        insert conList;
    }
}