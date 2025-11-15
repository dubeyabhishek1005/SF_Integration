@isTest
public with sharing class demoAccountTest {

    @isTest
    public static void testGetAccount() {
        Test.startTest();
        demoAccount.getAccount();
        Test.stopTest();
    }
}