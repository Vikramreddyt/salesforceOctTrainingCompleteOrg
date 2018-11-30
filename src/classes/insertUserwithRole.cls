public class insertUserwithRole {
    public static void roleWithUser() {
        // First DML operation
        Account a = new Account(Name='Acme',Email_Id__c = 'test_Nov24@gmail.com');
        insert a;
        
        // This next operation (insert a user with a role) 
        // can't be mixed with the previous insert unless 
        // it is within a future method. 
        // Call future method to insert a user with a role.
       Util.insertUserWithRole( a.Email_Id__c, 'mruiz', a.Email_Id__c, 'Ruiz');        
    }
}