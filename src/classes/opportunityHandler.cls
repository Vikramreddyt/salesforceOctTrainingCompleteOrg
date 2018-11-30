public class opportunityHandler {
    public static void updateRelatedPrimaryContact(List<opportunity> oppLst , Map<id,opportunity> oldOpptyMap, Map<id,Opportunity> newOptyMap){
        Set<id> relatedAccountIds = new Set<id>();
        
        if(!oppLst .isEmpty()){
            for(opportunity opp : oppLst){
                relatedAccountIds.add(opp.accountId);
            }
            if(!relatedAccountIds.isEmpty()){
                Map<id,account> accoutMap = new Map<id,account>([Select id,(select id,is_Primary__c from contacts where is_Primary__c=: true) from account]);
                for(opportunity opp : oppLst){
                    List<contact> conLst = accoutMap.get(opp.accountId).contacts;
                    system.debug('++ get related account and contact details ++++ '+accoutMap.get(opp.accountId)+' +++ conLst ++'+conLst.size());
                    if(conLst.size() > 0){
                        opp.Primary_contact__c = conLst[0].id;
                    }else{
                        opp.addError(system.label.isPrimaryCheckError);
                    }
                }
            }        
       }
    }
}