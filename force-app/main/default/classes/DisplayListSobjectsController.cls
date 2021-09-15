public class DisplayListSobjectsController {
    public String selectedObject { get; set; }
    public String selectedField { get; set; }
    @AuraEnabled
  	public static List<String> getObjectName(){
        List<String> objects=new List<String>();
       List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();  
        for(SObjectType sot:gd){
           objects.add(sot.getDescribe().getName());
           objects.sort();  
        }
        return objects;
    }
    
    /*
    @AuraEnabled
    public static SelectOption[] getObjectOptions() {
        SelectOption[] results = new SelectOption[] { new SelectOption('','-- none --') };
        for(SObjectType sType: Schema.getGlobalDescribe().values()) {
            DescribeSObjectResult res = sType.getDescribe();
            results.add(new SelectOption(res.getName(), res.getLabel()));
        }
        return results;
    }
    @AuraEnabled
    public static SelectOption[] getFieldOptions() {
        SelectOption[] results = new SelectOption[] { new SelectOption('','-- none --') };
        if(selectedObject != null) {
            for(SObjectField sField: Schema.getGlobalDescribe().get(selectedObject).getDescribe().fields.getMap().values()) {
                DescribeFieldResult res = sField.getDescribe();
                results.add(new SelectOption(res.getName(), res.getLabel()));
            }
        }
        return results;
    }
*/
}