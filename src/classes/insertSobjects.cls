//Syntax : public <access Specifiers> class calssName
//access Specifiers : Static , Public , Private , Protected , global 
//insertSobjects : Class
//insertSobjects() :  Method 
//Class Identifier : Key word 

public class insertSobjects {
    
    // Constructor Method
    public insertSobjects(){
        
    }
    
    //Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Non Static Method
	//Input Parameters : None
	//Return Type : None
    public void insertAccount(){
		
	}
	
	//Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Non Static Method
	//Input Parameters : Strings : firstname and Last Name
	//Return Type : None 
    public void insertAccountWithName(String firstName , String LastName){
		
	}
	
	//Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Non Static Method
	//Input Parameters : None
	//Return Type : Account
    public Account insertAccount_withParams(){
		account acc = new account();
		return acc;
	}
	
	//Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Non Static Method
	//Input Parameters : Strings : firstname and Last Name
	//Return Type : Account 
    public Account insertAccountWithName_withParams(String firstName , String LastName){
		account ac = new account();
		return ac;
	}
    
    //Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Static Method
	//Input Parameters : None
	//Return Type : None
    public static void insertAccount_Static(){
		
	}
    
    //Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Static Method
	//Input Parameters : Strings : firstname and Last Name
	//Return Type : None 
    public void insertAccountWithName_Static(String firstName , String LastName){
		
	}
    
    //Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Static Method
	//Input Parameters : None
	//Return Type : Account
    public static Account insertAccount_Static_withParams(){
		account acc = new account();
		return acc;
	}
    
    //Custom Method
	//void : Keyword which specifies this method returns nothing Empty 
	//Static Method
	//Input Parameters : Strings : firstname and Last Name
	//Return Type : Account 
    public static Account insertAccountWithName_Static_withParams(String firstName , String LastName){
		account ac = new account();
		return ac;
	}
}