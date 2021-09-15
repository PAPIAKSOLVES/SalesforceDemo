trigger AccountTrigger on Account (after insert) {
    List<Account> oppList = [SELECT Id,Name FROM Account WHERE ID IN :Trigger.New];
    System.debug(Trigger.New);
    system.debug(oppList);
    system.debug('hello');
}