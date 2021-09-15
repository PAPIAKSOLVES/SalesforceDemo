public class TaskController {
    @AuraEnabled
    public static list < sObject > fetchAccount(String query) {
      // query 10 records from account with their relevant contacts and return query.
    List < sObject > lstOfAcc = Database.query(query);
      return lstOfAcc;
    }
}