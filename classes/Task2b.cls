public class Task2b {
    @AuraEnabled(Cacheable=true)
    public static String Fieldsetmethod(String objectName, String fieldSetName)
    {
        Schema.DescribeSObjectResult sObjectDescribe = Schema.getGlobalDescribe().get(ObjectName).getDescribe();
        Schema.FieldSet fieldSet = sObjectDescribe.FieldSets.getMap().get(fieldSetName);
        return JSON.serialize(fieldSet.getFields());
    }
}