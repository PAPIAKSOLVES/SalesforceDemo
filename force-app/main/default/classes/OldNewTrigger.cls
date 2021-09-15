public class OldNewTrigger {

    public void updating(){
        List<Student__c> stuList = [SELECT City__c,Pincode__c FROM Student__c WHERE Name='Hello1'];
		List<Student__c> stuToUpdate = new List<Student__c>();

        for(Student__c stu: stuList){
            stu.City__c = 'Khandwa';
            stu.Pincode__c = '450001';
            stuToUpdate.add(stu);
        }

		update stuToUpdate;
    }
}