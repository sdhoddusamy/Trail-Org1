global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext  sc){
        List<Lead> leadList = [Select id, LeadSource FROM Lead Where LeadSource =''];
        for(Lead l: leadList){
            l.LeadSource = 'Dreamforce';
        }
        update leadList;
    }
}