public class Metadata_APEX_CursoDev {
    
    public static void tokenSObject(){
        Schema.sObjectType objectToken1 = Account.sobjectType;
        Schema.sObjectType objectToken2 = (new Account()).getSObjectType();

        system.debug('Tokens: ' + objectToken1 + ' = ' + objectToken2);

        Schema.DescribeSObjectResult objectResult = objectToken1.getDescribe();

        system.debug('Describe: ' + objectResult);
    }

    public static void tokenField(){
        Schema.SObjectField fieldToken1 = Account.Name;
        
        Schema.DescribeFieldResult fieldResult = Account.Name.getDescribe();

        Schema.SObjectField fieldToken2 = fieldResult.getSobjectField();

        system.debug('Tokens: ' + fieldToken1 + ' = ' + fieldToken2);

        system.debug('Describe Field: ' + fieldToken1.getDescribe());
    }

    public static void schemaMethod_List(){
        String[] objectTypes = new String[]{'Cursos__c'};
        Schema.DescribeSObjectResult[] objectResults = Schema.describeSObjects(objectTypes);

        System.debug(objectResults);

        system.debug('JSON: ' + JSON.serializePretty(objectResults));
    }
    
    public static void describeResult(){
        //Token
        Schema.DescribeSObjectResult accountToken = Account.sobjectType.getDescribe();
        system.debug('Token: ' + accountToken);
        //Schema
        Schema.DescribeSObjectResult acountSchema = Schema.sObjectType.Account;
        system.debug('Schema: ' + acountSchema);

    }

    public static void getAllObjects(){
        Map<String, Schema.SObjectType> allObjects = Schema.getGlobalDescribe();
        for(Schema.SObjectType rowObject : allObjects.values()){
            system.debug(rowObject);
        }
    }

    public static void getAllCustomObjects(){
        Map<String, Schema.SObjectType> allObjects = Schema.getGlobalDescribe();
        for(Schema.SObjectType rowObject : allObjects.values()){
            if(rowObject.getDescribe().isCustom()){
                system.debug(rowObject);
            }
        }
    }

    public static void getAllCustomObjectsInfo(){
        Map<String, Schema.SObjectType> allObjects = Schema.getGlobalDescribe();
        for(Schema.SObjectType rowObject : allObjects.values()){
            if(rowObject.getDescribe().isCustom()){
                system.debug(rowObject.getDescribe());
            }
        }
    }

}