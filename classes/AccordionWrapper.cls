public class AccordionWrapper {
    @AuraEnabled
    public static List<Accountwrapper>showAccounts(){
        List<Account> accList=[Select Id, Name, AnnualRevenue,Phone,(select FirstName,LastName,Phone, Name from contacts)
                               FROM Account Order By name LIMIT 10];
        List<Accountwrapper> acc=new List<Accountwrapper>();
        for(Account a: accList){
            Accountwrapper accw=new Accountwrapper();
            accw.aName=a.Name;
            accw.aAnnualRevenue=a.AnnualRevenue;
            accw.aphone=a.Phone;
            accw.conList=a.contacts;
            acc.add(accw);
        }
        return acc;      
    }    
    
    //WrapperClass
    
    public class Accountwrapper{
    @AuraEnabled
    public String aName;
    @AuraEnabled
    public Decimal aAnnualRevenue;
    @AuraEnabled  
    public String aphone;
    @AuraEnabled
    public List<Contact> conList;
}
}