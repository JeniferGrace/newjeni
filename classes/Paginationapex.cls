public class Paginationapex {
      @AuraEnabled(cacheable = true)
    public static List<Account> getAccountsData(String pageSize, String pageNumber){
        Integer ps = Integer.valueOf(pageSize);
        Integer pn = Integer.valueOf(pageNumber)-1;
        
        List<Account> accounts = [SELECT
                                  Id, Name, Phone, Rating, SLAExpirationDate__c
               					  FROM Account LIMIT :Integer.valueOf(ps) OFFSET :(ps*pn)];
        return accounts;
    }
    
    @AuraEnabled
    public static List<Account> getdate(Integer searchkey){
        return [Select Id,Name,Phone, Rating, SLAExpirationDate__c from Account where CALENDAR_YEAR(SLAExpirationDate__c)=:searchkey];
    } 

}