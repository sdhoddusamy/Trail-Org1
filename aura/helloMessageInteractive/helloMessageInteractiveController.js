({
	handleClick : function(component, event, helper) {
        var msg = event.getSource().get('v.label');
        console.log("HandleClick message: "+msg);
        component.set('v.message', msg);
	}
})