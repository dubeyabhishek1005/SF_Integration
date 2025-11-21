({
	onClickYes : function(component, event, helper) {
        /*
			var btnClicked = event.getSource();   
            var buttonValue = btnClicked.get("!v.label");
        	
        	component.set("v.message", buttonValue);
        */
        
        helper.commonFunc(component, event);
	},
    onClickNo : function(component, event, helper) {
        /*
			var btnClicked = event.getSource();   
            var buttonValue = btnClicked.get("!v.label");
        	
        	component.set("v.message", buttonValue);
        */
        helper.commonFunc(component, event);
	}
})