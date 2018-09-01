({
     
    // function call on component Load
    doInit: function(component, event, helper) {
        // create a Default RowItem [Account Instance] on first time Component Load
        // by call this helper function  
        helper.createObjectData(component, event);
    },
     
    // function for save the Records 
    Save: function(component, event, helper) {
        // first call the helper function in if block which will return true or false.
        // this helper function check the "Account Name" will not be blank on each row.
        if (helper.validate(component, event)) {
            // call the apex class method for save the Account List
            // with pass the contact List attribute to method param.  
            var action = component.get("c.SaveAccounts");
            action.setParams({
                "accList": component.get("v.AccountList")
            });
            // set call back 
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    // if response if success then reset the 'AccountList' Attribute 
                    // and call the common helper method for create a default Object Data to Account List 
                    component.set("v.AccountList", []);
                    helper.createObjectData(component, event);
                    alert('Account records saved successfully');
                }
            });
            // enqueue the server side action  
            $A.enqueueAction(action);
        }
    },
     
    // function for create new object Row in Contact List 
    addRow: function(component, event, helper) {
        // call the comman "createObjectData" helper method for add new Object Row to List  
        helper.createObjectData(component, event);
    },
     
    // function for delete the row 
    removeDeletedRow: function(component, event, helper) {
        //get the selected row Index for delete, from Lightning Event Attribute  
        var index = event.getParam("indexVar");
        //get the all List (AccountList attribute) and remove the Object Element Using splice method    
        var AllRowsList = component.get("v.AccountList");
        AllRowsList.splice(index, 1);
        //set the AccountList after remove selected row element  
        component.set("v.AccountList", AllRowsList);
    },
    
    openVFPage: function(component, event, helper) {
        //window.open( '/apex/TestVF', '500', '500' );
        console.log( component.get('deng') );
    },
})