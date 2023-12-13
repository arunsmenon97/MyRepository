
trigger ContactTrigger on Contact (after insert, after update, after undelete , after delete ) {

List<Contact> conlist = new List<Contact>();

if( Trigger.isInsert || Trigger.isUndelete ) 
{
conlist.addAll(Trigger.new);
}
if( Trigger.IsDelete) 
{
conlist.addAll(Trigger.old);
}
if( Trigger.IsUpdate) 
{
conlist.addAll(Trigger.new);
conlist.addAll(Trigger.old);
}

Set<id> accId = new  Set<id>();

for(Contact con : conlist) 
{
accId.add(con.accountId);
}

List<Account> accountList = [Select Name,Number_Of_Contact__c, (select Name from Contacts) from Account WHERE Id IN :accId];

for(Account acc : accountList) 
{
acc.Number_Of_Contacts__c = acc.contacts.size();
}   
update accountList;
}