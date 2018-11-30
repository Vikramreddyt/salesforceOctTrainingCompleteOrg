public class updateAccountNameScheduler implements Schedulable{
	public void execute(SchedulableContext sc){
        updateAccountName b= new updateAccountName();
        Database.executebatch(b);
    }
}