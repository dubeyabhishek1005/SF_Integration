public with sharing class demoAccount {

    public static void getAccount() {
        List<Account> acc = [Select Id, Name FROM Account LIMIT 10];
        System.debug('--Get Account--'+acc);
    }
}