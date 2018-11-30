trigger sendEmailToRetailStoreOwner on Outlet__c (after insert,after update) {
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        sendingEmailThroughOutlet.sendEmilToRetailStoreOwnerFromOutlet(trigger.new,trigger.oldMap,trigger.newMap);
    }
}