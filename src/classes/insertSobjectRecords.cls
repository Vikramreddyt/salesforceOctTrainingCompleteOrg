//Class to Create Sobject Records
public class insertSobjectRecords {
	//Non Static Method to insert Account 
    public void insertAccoutDetails(String firstName , string lName, string accemailId){
        account acc = new Account( Name = firstName + ' '+ lName , Email_Id__c = accemailId );
        insert acc;
        system.debug(' ++ Account Inserted +'+acc);
    }
    
    //Static Method to insert Account 
    public static void insertAccoutDetails_Sta(String firstName , string lName, string accemailId){
        account acc = new Account( Name = firstName + ' '+ lName , Email_Id__c = accemailId );
        insert acc;
        system.debug(' ++ Account Inserted +'+acc);
    }
}