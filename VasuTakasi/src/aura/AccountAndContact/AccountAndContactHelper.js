({
    loadRecords : function(component) {
        var action = component.get("c.getRecords");
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.records", response.getReturnValue());    
            }

            // Display toast message to indicate load status
            var toastEvent = $A.get("e.force:showToast");
            if (state === 'SUCCESS'){
                toastEvent.setParams({
                    "title": "Success!",
                    "message": " Your contacts have been loaded successfully."
                });
            }
            else {
                toastEvent.setParams({
                        "title": "Error!",
                        "message": " Something has gone wrong."
                });
            }
            toastEvent.fire();
            
        });
         $A.enqueueAction(action);           
    },
    
    saveRecords : function(component) {
        console.log('entered');
		var recordsWrapper = component.get("v.records");
        for( var k in recordsWrapper )
        {
            var formId = '0019000000AGf8qAAD';//recordsWrapper[k].accountObj.Id;
            console.log(formId);
            var fm = component.find(formId);//.submit();
            console.log(fm);
        }
        var action = component.get("c.saveAllRecords");
        action.setParams({"recordsWrapperList":recordsWrapper});
        action.setCallback(this, function(response){
            console.log('response == '+response.getState());
            });
     	$A.enqueueAction(action); 
	}
})