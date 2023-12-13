public class RecentAccountsHandler {
    @AuraEnabled(cacheable=true)
    public static List<Account> getRecentAccounts() {
        return [SELECT Id, Name, CreatedDate FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}
