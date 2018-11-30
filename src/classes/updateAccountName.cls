global class updateAccountName implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        id accid = '0016F00002pCPFV'; 
        String query = 'SELECT Id,Name,Email_Id__c FROM Account where id =:accid LIMIT 1';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        // process each batch of records
 
        List<contact> conDetLst = new List<contact>(); 
        for(Account acc : accList)
        {        
            // Update the Account Name 
            //acc.Name = acc.Name + 'from Batch Class';
            //if(acc.Email_Id__c == '' || acc.Email_Id__c == null)
                //acc.Email_Id__c = 'test@gmail.com';
                //
           for(integer i=10000 ; i < 19999 ; i++){
                contact c = new contact();
                c.FirstName = 'test Con' ;
                c.LastName = string.valueof(i);
                c.accountid = acc.id;
                conDetLst.add(c);
            }
                
        }
        try {
            // Update the Account Record
            insert conDetLst;
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
   }
}