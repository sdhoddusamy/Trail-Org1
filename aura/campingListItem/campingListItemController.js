({
	packItem : function(component, event, helper) {
        //var checkbox = component.set('v.item', true);
        //checkbox.Packed__c = true;
        component.set('v.item.Packed__c', true);
        event.getSource().set('v.disabled', true);
	}
})