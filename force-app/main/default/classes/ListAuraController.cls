public class ListAuraController {
     
    @AuraEnabled
    public static List <String> getPiklistValues(String ObjName) {
        List<String> plValues = new List<String>();
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(ObjName);
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        Map<String, Schema.SObjectField> StuMap = objDescribe.fields.getMap();
        
        for (String str : StuMap.keyset()) 
        {
            //plValues.add(str);    
            
            Schema.DescribeFieldResult fieldResult=StuMap.get(str).getDescribe();
            plValues.add(fieldResult.getName()); 
        }
        plValues.sort();
        return plValues;
   }
}