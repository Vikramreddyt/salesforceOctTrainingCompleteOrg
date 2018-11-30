trigger opportunityTrigger on Opportunity (before insert,before update,before delete, after insert , after update , after delete ) {
    List<opportunity> oppLst = new List<opportunity>();
    for(opportunity op: trigger.new){
        if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
            if(op.accountId != null){
                oppLst.add(op);
            }
        }
    }
    if(!oppLst.isEmpty()){
        opportunityHandler.updateRelatedPrimaryContact(trigger.new , trigger.oldMap , trigger.newMap);
    }
}