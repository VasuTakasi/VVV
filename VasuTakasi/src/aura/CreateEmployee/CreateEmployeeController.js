({
	createEmployee : function(component, event, helper) {
        var vallid = true;
		var empNameFld = component.find("empName");
        var empName = empNameFld.get("v.value");
        if ($A.util.isEmpty(empName)){
            vallid = false;
            empNameFld.set("v.errors", [{message:"Emp name can't be blank."}]);
        }
        else {
            empNameFld.set("v.errors", null);
        }
        
        if(vallid)
        {
            var emp = component.get("v.empObj");
            helper.createEmp(component,emp);
        }
	},
    
       
    handleShowNotice : function(component, event, helper) {
        console.log(component.find("notifLib").showNotice());
        component.find("notifLib").showNotice({
            "variant": "error",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    }

})