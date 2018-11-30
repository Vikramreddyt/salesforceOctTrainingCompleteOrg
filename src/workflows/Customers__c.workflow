<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Welcome_note_to_the_New_Customer</fullName>
        <description>Welcome note to the New Customer</description>
        <protected>false</protected>
        <recipients>
            <field>Customer_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Company_Email_Templates/New_Customer_Welcome_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Deactivate_the_Customer</fullName>
        <field>IsActive__c</field>
        <literalValue>0</literalValue>
        <name>Deactivate the Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Notification_Sent</fullName>
        <description>Default the date to Current Date</description>
        <field>New_Notification_Sent_Date__c</field>
        <formula>TODAY()</formula>
        <name>New Notification Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ReActivate_the_Customer</fullName>
        <field>IsActive__c</field>
        <literalValue>1</literalValue>
        <name>ReActivate the Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_the_Customer_Status</fullName>
        <field>Customer_Status__c</field>
        <literalValue>Joined</literalValue>
        <name>Update the Customer Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_the_Status_to_Rejoined</fullName>
        <field>Customer_Status__c</field>
        <literalValue>Re Joined</literalValue>
        <name>Update the Status to Rejoined</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Create a Task for User</fullName>
        <actions>
            <name>Welcome_note_to_the_New_Customer</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Notification_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_the_Customer_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Please_take_care_of_the_New_Customer</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customers__c.IsActive__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notify a user regarding new Customer Creation.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Have_u_completed_the_Task</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Customers__c.New_Notification_Sent_Date__c</offsetFromField>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Deactivate the Customer</fullName>
        <actions>
            <name>Deactivate_the_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Deactivate_the_Customer</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Customers__c.Customer_Status__c</field>
            <operation>equals</operation>
            <value>Suspended from Subscription,Removed from Subscription,Deactivate the Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Customers__c.IsActive__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Deactivate the Customer</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>ReActivate_the_Customer</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Update_the_Status_to_Rejoined</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Customers__c.Re_Activate_After_Suspension__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Deactivate_the_Customer</fullName>
        <assignedTo>user2_octorg@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Deactivate the Customer</subject>
    </tasks>
    <tasks>
        <fullName>Have_u_completed_the_Task</fullName>
        <assignedTo>user2_octorg@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>jsdjsdvjsjdvjvsjvjsdvjvsjdvjd</description>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Customers__c.New_Notification_Sent_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Have u completed the Task</subject>
    </tasks>
    <tasks>
        <fullName>Please_take_care_of_the_New_Customer</fullName>
        <assignedTo>user2_octorg@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>New Customer had been joined in please take care.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Please take care of the New Customer</subject>
    </tasks>
</Workflow>
