({
	 createEmp: function(component, empObject) {
    var empObject = component.get("v.empObj");
            var action = component.get("c.saveEmp");
            action.setParams({"empObj":empObject});
         
    action.setCallback(this, function(response){
        var state = response.getState();
        console.log(state);        
        if (component.isValid() && state === "SUCCESS") {
             var auraResponse = response.getReturnValue(); 
            //var emp = component.get("v.empObj");
            //expenses.push(response.getReturnValue());
            //component.set("v.empObj", emp);
            //throw new Error("I can’t go on. This is the end.");    
            //--
            $A.createComponents([
                ["ui:message",{
                    "title" : auraResponse.statusInfo,
                    "severity" :auraResponse.statusInfo,
                }],
                ["ui:outputText",{
                    "value" : auraResponse.message
                }]
                ],
                function(components, status, errorMessage){
                    console.log('status____'+state);
                    var div1 = component.find("div1");
                    var message = components[0];
                    var outputText = components[1];
                    message.set("v.body", outputText);                        
                    div1.set("v.body", message);                                       
                }
            );
            //--            
        }
        else if (state === "INCOMPLETE") {
                        console.log("No response from server or client is offline.")
                        // Show offline error
                    }
                    else if (state === "ERROR") {
                         
                    }
    });
     $A.enqueueAction(action); 
   }
})