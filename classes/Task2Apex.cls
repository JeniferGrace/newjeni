public class Task2Apex {
    
    @AuraEnabled
    public static Id getAccounts(String AccountName, String Industry, String Phone){
        Account accn = new Account();
        accn.Name = AccountName;
        accn.Industry = Industry;
        accn.Phone = Phone;
        insert(accn);
        
        Contact conc = new Contact();
        conc.LastName = AccountName;
        conc.AccountId = accn.Id;
        insert(conc);
        return(accn.Id);
        
    }
    

}