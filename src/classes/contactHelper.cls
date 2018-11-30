public class contactHelper {
    public static void isPrimaryCheckOnContact(List<contact> newlyInsertedContacts , Map<id,contact> contactOldMap , Map<id,contact> contactNewMap ){
        set<id> contactAccountIdSet = new Set<id>();
        Map<id,account> accMap =  new Map<id,account>();
        system.debug(' +++ newlyInsertedContacts+++ : '+newlyInsertedContacts + ' +++ contactOldMap ++ : ' +contactOldMap + ' ++contactNewMap+++ : '+contactNewMap);
        if(!newlyInsertedContacts.isEmpty()){
            for(contact co : newlyInsertedContacts){
                contactAccountIdSet.add(co.accountId);
            }
            if(!contactAccountIdSet.isEmpty()){
                List<account> accountLst = [select id,name,(select id,is_Primary__c from contacts where is_Primary__c = true) from account where id IN: contactAccountIdSet];
                for(account a : accountLst ){
                    accMap.put(a.id,a);
                }
            }
        }
        for(contact con : newlyInsertedContacts){
            system.debug(' ++con +++'+con );
            if(con.id != null){
                boolean accounthasPrimaryContactsUpdate = false ;
                system.debug( 'olMap Value +++ ' + contactOldMap.get(con.id).is_Primary__c + ' ++ New Map Value +++ '+ contactNewMap.get(con.id).is_Primary__c);
                if(contactOldMap.get(con.id).is_Primary__c != contactNewMap.get(con.id).is_Primary__c ){
                    if(con.is_Primary__c == true){
                    for(account acc : accMap.values()){
                        
                        list<contact> conLst = accMap.get(con.accountId).contacts;
                        for(contact c : conLst){
                            if(c.id != con.id){
                                accounthasPrimaryContactsUpdate = true ;
                            }
                        }
                    }
                    if(accounthasPrimaryContactsUpdate ){
                        con.addError('A primary contact is already defined so this contact cannot be defined as Primary once again');
                    }
                }
                    
                }
            } else {
                boolean accounthasPrimaryContacts = false ;
                if(con.is_Primary__c == true){
                    for(account acc : accMap.values()){
                        list<contact> conLst = accMap.get(con.accountId).contacts;
                        if(conLst.size() > 0 ){
                            accounthasPrimaryContacts = true ;
                        }
                    }
                    if(accounthasPrimaryContacts){
                        con.addError('A primary contact is already defined so this contact cannot be defined as Primary once again');
                    }
                }   
            }
        }
    }
}