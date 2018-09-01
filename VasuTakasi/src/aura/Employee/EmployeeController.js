({/*
	clickCreateEmployee : function(component, event, helper) {
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
            helper.createEmp(component,component.get("v.empObj"));
        }
	},*/
    
    doTestMe:function(cmt, event, helper ) {
        console.log(cmt);
         //$A.enqueueAction(action);
    }
})