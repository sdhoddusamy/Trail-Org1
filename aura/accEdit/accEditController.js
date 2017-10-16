({
	saveAccount : function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "ERROR") {
                var errMsg = "";
                // saveResult.error is an array of errors,
                // so collect all errors into one message
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                component.set("v.recordSaveError", errMsg);
            } else {
                component.set("v.recordSaveError", "");
            }

        }));
	},
    handleRecordUpdate: function(component, event, helper){
      var eventParams = event.getParams();
    	if(eventParams.changeType === "ERROR") {
            console.log('Error: ' + component.get("v.recordSaveError"));
        }
    }
    
    })