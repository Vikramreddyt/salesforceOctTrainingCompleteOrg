/*
    Class Name : myFirstControllerClass 
    Purpose :  to check the variable declaration both in page and controller
    Methods : 
                Constructor : to get the values from Userinfo Classs.
                Action Defind from Page Method name is "myFirstControllerClass" and another Method Name : getMyName 
    Created Date :
    Last Modified by :
    Last modified reason :
                 
   
*/
public with sharing class myFirstControllerClass {

    public String userSessionId { get; set; }
    public string userEmail{get;set;}//Variable declaration in controller
    
    public myFirstControllerClass(){
        userEmail = userinfo.getUserEmail();
        userSessionId = userinfo.getSessionId();
    }
    
    public String getMyName() {
        User u = [Select id,name from user where id =: userInfo.getUserId()];
        return u.name;
        //return = userInfo.getUserId();
    }

}