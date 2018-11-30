global class UserCreation 
   {
        
       Webservice static String Createuser(String Firstname, String Lastname,String Email, String Username)
       {    
          String Response='none';
         try{
                  if(Email == null || Email == '') {
                   Response = 'Email is empty';
                   return Response;             
                  }
                  if(Firstname == null || Firstname == '') {
                   Response = 'First Name is Empty';
                   return Response;             
                  }
                               
                  List<User> lstuser2 = [Select id, email from user where Username =:Username];
                  if(lstuser2.size()>0) {
                    Response = 'Unable to create User. Username already exists. Please provide a unique Username.';
                    return Response;
                  } 
                
                if(Email != null || Email !='') { 
                                              
                        List<Profile> profiles = [Select p.name, p.id From Profile p where p.name ='Standard Platform User' and p.UserLicense.Name like '%Salesforce Platform%']; 
                        
                          Database.DMLOptions dmo = new Database.DMLOptions();
                          dmo.EmailHeader.triggerUserEmail = true;
                          User u = new User(alias = 'portuser', email=Email, 
                          emailencodingkey='UTF-8', FirstName = Firstname, Lastname = Lastname, languagelocalekey='en_US', 
                          localesidkey='en_US', profileid = profiles[0].id,timezonesidkey='America/Los_Angeles', username=Username);              
                                    
                          u.setOptions(dmo);
                          insert u;
                          //Create group on @future(creategroupknown) method>>>>>>>>>>>>>>>>>>>>>>>>>>
                          creategroupKnown(u.id);               
                                       
                          Response = ' User created successfully';
                          return Response;
                        
                    
                    
                }   
              Response = 'Email is empty';   
              return Response;
                     
            }catch(Exception ex)
            {
                    Response = ex.getMessage();
                    System.debug('Exception>>>>>'+Response);
                    return Response;
            } 
          } 
       
       
       
       //@future
       public static void creategroupKnown(id userid2)
       {
        
                 List<Group> knowngroup = [SELECT Id,Name FROM Group where name='Known Customer'];
                 Groupmember obj1 = new Groupmember();
                 obj1.GroupId = knowngroup[0].id;
                 obj1.UserOrGroupId = userid2;
                 insert obj1;
             
       }
       
       
        
    }