public class retailStoreObjectHandler {
    
    /*  
        Logic : We need to insert the outlets based on the Outlet count Field 
        Input Parameters : Retail Store ID 
        Ouput : No of outlets need to be inserted based on the Count
        Developer Name :
        Defect Id or Ticket Number :
        Requestor :
        Created Date :
        Last Modified Date :
        Approach to verify the Count : Check the vaue of r.Count_Of_Outlets__c , 
            aganist the records which are already tagged to this retail store (Count of all the outlets in the retailstore)
            if this count differs the do the insertion
    */ 
    @invocableMethod
    //public static void insertNoOfOutlets(Id retailStoreId){
    public static void insertNoOfOutlets(List<Id> retailStoreIdLst){
        //using an innner Query to reduce another Query ::: parent to Query 
        List<Retail_Shop__c> rsLst = [Select id,Name,Count_Of_Outlets__c,Country__c,State__c,(Select id,name from Outlets__r) from Retail_Shop__c where id IN:retailStoreIdLst ];
        system.debug('+++rsLst+++++'+rsLst);
        Map<id,integer> retailStoreCountMap = new Map<id,integer>();
        Map<id,Retail_Shop__c> retailStoreMap = new Map<id,Retail_Shop__c>();
        Map<id,List<Outlet__c>> outLetsMap = new Map<id,List<Outlet__c>>();
        
        /*integer countOfOutlets = integer.valueOf(r.Count_Of_Outlets__c) ;
        //List<Outlet__c> relatedOutletsLst = [select id , Retail_Shop__c from Outlet__c where Retail_Shop__c =: retailStoreId];
        List<Outlet__c> relatedOutletsLst = r.Outlets__r;
        if(!relatedOutletsLst.isEmpty()){
            //relatedOutletsLst.clear();
            delete relatedOutletsLst;
            system.debug('+++relatedOutletsLst+++'+relatedOutletsLst.size());
        }
        List<Outlet__c> outletsLst = new List<Outlet__c>();
        //Decimal countOfOutlets = r.Count_Of_Outlets__c;
        //for(integer i = 0;i < integer.valueOf(r.Count_Of_Outlets__c);i++ )
        //for(decimal i = 0;i < r.Count_Of_Outlets__c;i++ )
        //Doing any logical operations make sure we have a null Check on the specific data we are looking in to.
        system.debug(' +++ countOfOutlets +++ '+countOfOutlets + ' ++relatedOutletsLst++'+relatedOutletsLst.size()+ ' ++++ Comparision Result ++++'+(countOfOutlets > relatedOutletsLst.size()));
        if(countOfOutlets != null && countOfOutlets != 0){
            for(integer i = 0;i < countOfOutlets;i++ ){
                Outlet__c out = new Outlet__c(Name = r.Name + ' ' +i , Retail_Shop__c = r.Id , Active__c =  true , Q1_Income__c = 20000 , Q2_Income__c = 30000 , Q3_Income__c =  50000 , Q4_Income__c = 10000 , Yearly_Income__c = 500000 , Country__c = r.Country__c ,  State__c = r.State__c);
                outletsLst.add(out);
            }
            if(!outletsLst.isEmpty()){
                insert outletsLst;
            }    
        }  */   
        
        /* Bulkified Code */
        if(!rsLst.isEmpty()){
            //List<Outlet__c> relatedOutletsLst = new List<Outlet__c>();
            for(Retail_Shop__c rs : rsLst){
                retailStoreCountMap.put(rs.id , integer.valueof(rs.Count_Of_Outlets__c));
                retailStoreMap.put(rs.Id,rs);
                List<Outlet__c> relatedOutletsLst = rs.Outlets__r;
                
                if(!relatedOutletsLst.isEmpty()){
                    outLetsMap.put(rs.id ,relatedOutletsLst );
                }
                //relatedOutletsLst.clear();
            }
            system.debug('  +++outLetsMap++++ '+outLetsMap);
            //delete the existing outlest related to retail store 
            if(!outLetsMap.isEmpty()){
                List<Outlet__c> deleteOutLets = new List<Outlet__c>();
                system.debug('++++outLetsMap+++'+outLetsMap+ ' ++outLetsMapKeys+++'+outLetsMap.keySet()+ ' ++outLetsMap+++ '+outLetsMap.values());
                for( id rsId: outLetsMap.keySet()){
                    system.debug(' +++ rsId++++' + outLetsMap.get(rsId));
                    for(Outlet__c o : outLetsMap.get(rsId)){
                        deleteOutLets.add(o);
                    }
                }
               delete deleteOutLets;
            }
            List<Outlet__c> outletsLst = new List<Outlet__c>();
            for(id rtShpId :  retailStoreCountMap.keySet()){
                for(integer i = 0;i < retailStoreCountMap.get(rtShpId);i++ ){
                    Outlet__c out = new Outlet__c(Name = retailStoreMap.get(rtShpId).Name + ' ' +i , Retail_Shop__c = rtShpId , Active__c =  true , Q1_Income__c = 20000 , Q2_Income__c = 30000 , Q3_Income__c =  50000 , Q4_Income__c = 10000 , Yearly_Income__c = 500000 , Country__c = retailStoreMap.get(rtShpId).Country__c ,  State__c = retailStoreMap.get(rtShpId).State__c);
                    outletsLst.add(out);
                }
                if(!outletsLst.isEmpty()){
                    insert outletsLst;
                }    
            }    
        }
        
    }
}