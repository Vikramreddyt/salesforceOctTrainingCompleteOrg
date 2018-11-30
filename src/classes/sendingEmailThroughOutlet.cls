public class sendingEmailThroughOutlet {
    public static void sendEmilToRetailStoreOwnerFromOutlet(List<Outlet__c> newOutletLst , Map<id,Outlet__c> oldOutletMap , Map<id,Outlet__c> newOUtletMap){
        set<id> retailStoreIds = new Set<id>();
        for(Outlet__c outLet:newOutletLst ){
            if(outLet.Retail_Shop__c != null){
                retailStoreIds.add(outLet.Retail_Shop__c);
            }
        }
        if(!retailStoreIds.isEmpty()){
            Map<id,Retail_Shop__c> retailStoreMap = new Map<id,Retail_Shop__c>([Select id,Retail_Shop_Owner__c from Retail_Shop__c where id IN:retailStoreIds]);
            for(Outlet__c outLet:newOutletLst ){
                Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
                List<string> toAddresses = new List<string>();
                toAddresses.add(retailStoreMap.get(outLet.Retail_Shop__c).Retail_Shop_Owner__c);
                toAddresses.add(outLet.Outlet_Owner_Email__c);
                mail.setToAddresses(toAddresses);
                mail.setSubject('Send an email Test');
                string template = 'test the Template \n jsvjcvsjvdjsd \n';
                template += 'test Subject 123';
                List<string> args = new List<string>();
                args.add(outLet.Name);
                string formattedHtml = string.format(template,args);
                mail.setPlainTextBody(formattedHtml);
                Messaging.sendemail(new Messaging.singleEmailMessage[]{mail});
            }
        }    
    }
}