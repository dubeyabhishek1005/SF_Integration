public class helloWorldController {
    
    @AuraEnabled
    public static Lead getLeads(){
        Lead ld = [Select Id, Name, Email FROM Lead LIMIT 1];
        System.debug('Lead -- '+ ld);
        return ld;
    }

}