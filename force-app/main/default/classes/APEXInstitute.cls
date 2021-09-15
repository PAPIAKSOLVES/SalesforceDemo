public class APEXInstitute
{
    public List<Institute__c> StudentRecords {get;set;}
    public List<Institute__c> StudentRecords2 {get;set;}
    public String currentRecordId {get;set;}
    public void search()
    {    
        StudentRecords = [SELECT Name,Mentor__c,Designation__c FROM Institute__c where Name=:selectedname];
    }
     public void searching()
    {   //currentRecordId  = ApexPages.CurrentPage().getparameters().get('n');
        system.debug('hello '+selectedId);
        StudentRecords2 = [SELECT Student_Name__c,Class__c,City__c,State__c FROM Institute__c where Guide__c=:selectedId];
        
    }
    
    public void insertion()
    {
        List<Institute__c> conList = new List<Institute__c> 
        {
            new Institute__c(Name='Ins1',Mentor__c='Mentor1',Designation__c='Des1'),
            new Institute__c(Name='Ins1',Mentor__c='Mentor2',Designation__c='Des2'),
            new Institute__c(Name='Ins2',Mentor__c='Mentor3',Designation__c='Des3'),
            new Institute__c(Name='Ins2',Mentor__c='Mentor4',Designation__c='Des4')    
		};    
        // Bulk insert all contacts with one DML call
        insert conList;
    }
    
    public void insertion2()
    {
        List<Institute__c> conList = new List<Institute__c> 
        {
            new Institute__c(Student_Name__c='Stu1',Class__c='Class1',City__c='City1',State__c='State1',Guide__c='Ins1'),
            new Institute__c(Student_Name__c='Stu2',Class__c='Class2',City__c='City2',State__c='State2',Guide__c='Ins1'),
            new Institute__c(Student_Name__c='Stu3',Class__c='Class3',City__c='City3',State__c='State3',Guide__c='Ins2'),
            new Institute__c(Student_Name__c='Stu4',Class__c='Class4',City__c='City4',State__c='State4',Guide__c='Ins2')
		};    
        // Bulk insert all contacts with one DML call
        insert conList;
    }
    
    Public string selectedname{get;set;}
    Public string selectedstudent{get;set;}
    Public string selectedId{get;set;}
    
    Public List<Selectoption> getselectedaccnamefields()
    {
        List<Selectoption> lstnamesel = new List<selectoption>();
        lstnamesel.add(new selectOption('', '- None -'));
        for(Institute__c acc :[SELECT Name FROM Institute__c])
        {
            lstnamesel.add(new selectoption(acc.Name,acc.Name));
        }
        return lstnamesel; 
    }
    
}