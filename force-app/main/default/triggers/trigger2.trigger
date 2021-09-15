trigger trigger2 on Student__c (after update) 
{
    List<Student_History__c> oppList = new List<Student_History__c>();
    Student__c NewStu = trigger.new[0]; 
    Student__c OldStu = trigger.old[0];  
    Student__c StuObject = new Student__c(); 
    // This takes all available fields from the required object. 
    Schema.SObjectType objType = StuObject.getSObjectType(); 
    Map<String, Schema.SObjectField> StuMap = Schema.SObjectType.Student__c.fields.getMap(); 
    
    for (Student__c StuLoop : Trigger.New) 
    {
/*        Student__c oldOpp=Trigger.oldMap.get(a.Id);
        
        if(oldOpp.City__c!=a.City__c)
        {
        
        oppList.add(new Student_History__c(Field_Name__c='City',
                                           Old_Value__c=oldOpp.City__c+'',
                                           New_Value__c=a.City__c+'',
                                           Record_Id__c=a.Id )); 
        }
        if(oldOpp.Pincode__c!=a.Pincode__c)
        {
        
        oppList.add(new Student_History__c(Field_Name__c='Pincode',
                                           Old_Value__c=oldOpp.Pincode__c+'',
                                           New_Value__c=a.Pincode__c+'',
                                           Record_Id__c=a.Id )); 
        }
  */
        for (String str : StuMap.keyset()) { 
        try { 
            System.debug('Field name: '+str +'. New value: ' 
                         + NewStu.get(str) +'. Old value: '
                         +OldStu.get(str)); 
            if(NewStu.get(str) != OldStu.get(str)){ 
                system.debug('******The value has changed!!!! '); 
                 oppList.add(new Student_History__c(Field_Name__c=str,
                                           Old_Value__c=OldStu.get(str)+'',
                                           New_Value__c=NewStu.get(str)+'',
                                           Record_Id__c=StuLoop.Id )); 
      
                // here goes more code 
                
            } 
        } 
        catch (Exception e) { 
            System.debug('Error: ' + e); 
        } 
    }
        
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}