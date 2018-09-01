({
	 createEmp: function(component, empObject) {
    var empObject = component.get("v.empObj");
            var action = component.get("c.saveEmp");
            action.setParams({"empObj":empObject});
         
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            //var emp = component.get("v.empObj");
            //expenses.push(response.getReturnValue());
            //component.set("v.empObj", emp);
        }
    });
    $A.enqueueAction(action);
     }
})