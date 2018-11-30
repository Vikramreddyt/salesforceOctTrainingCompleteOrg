global class accountCreation{
 
  webservice static void accCreate(String name, String phone){
     Account acc = new Account();
     acc.name = name;
     acc.phone = phone;
     acc.Email_Id__c = 'testSAOPINsertion@gmail.com'; 
     insert acc;
  }  
}