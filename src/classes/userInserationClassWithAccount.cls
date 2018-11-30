public class userInserationClassWithAccount {
public void insertData(){
insertUserwithRole.roleWithUser();
        Account acc=new Account(Name='Testing Record',industry='Energy',type='Other',phone='+22-3535543');
insert acc;
system.debug(acc);
    }
   @future
    public static void ExampleMethod (){
    profile p=[select id,name FROM profile WHERE name='Standard Platform User'];
        user u =new user(alias='Gorge',email='Samuel.Gorge@janbask.com',emailencodingkey='UTF-8',lastname='Samuel',languagelocalekey='en_US',localesidkey='en_US',profileid=p.id, timezonesidkey='America/Los_Angeles',userName='Gorge@gmail.com',communityNickName='akash',isactive=false);
    insert u;
    system.debug(u);

 }
}