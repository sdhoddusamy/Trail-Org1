({
	doInit : function(component, event, helper) {
        var action = component.get('c.getItems');
        action.setCallback(this, function(response){
        	var state1 = response.getState();
            if (state1 === "SUCCESS") {
                component.set('v.items', response.getReturnValue());
            }
            else{
                console.log("failed with state: "+state1);
            }
        });
        $A.enqueueAction(action);
    },
    handleAddItem : function(component, event, helper){
        var newItem = event.getParam('item');
        console.log('Begin Create: '+newItem);
        var action = component.get('c.saveItem');
        action.setParams({'item': newItem});

        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }else{
                console.log("Failed with: "+ response);
            }
        });
        $A.enqueueAction(action);
    }
})