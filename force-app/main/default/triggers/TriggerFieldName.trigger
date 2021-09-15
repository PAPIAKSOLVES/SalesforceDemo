trigger TriggerFieldName on Student__c (after update) {
 
    Student__c NewLead = trigger.new[0]; 
    Student__c OldLead = trigger.old[0]; 
    Student__c LeadObject = new Student__c(); 
    // This takes all available fields from the required object. 
    Schema.SObjectType objType = LeadObject.getSObjectType(); 
    Map<String, Schema.SObjectField> M = Schema.SObjectType.Student__c.fields.getMap(); 
    for (String str : M.keyset()) { 
        try { 
            System.debug('Field name: '+str +'. New value: ' 
                         + NewLead.get(str) +'. Old value: '
                         +OldLead.get(str)); 
            if(NewLead.get(str) != OldLead.get(str)){ 
                system.debug('******The value has changed!!!! '); 
                // here goes more code 
                
            } 
        } 
        catch (Exception e) { 
            System.debug('Error: ' + e); 
        } 
    } 
}