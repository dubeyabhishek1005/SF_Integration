({
	commonFunc : function(component, event) {
        
			var btnClicked = event.getSource();   
            var buttonValue = btnClicked.get("v.label");
        	component.set("v.message", buttonValue);
        
        /*  component.set("v.message", event.getSource().get("v.label"));  */
	}
})