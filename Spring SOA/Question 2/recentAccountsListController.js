({
    doInit: function(component, event, helper) {
        // Fetch recent accounts on component initialization
        var action = component.get("c.getRecentAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.recentAccounts", response.getReturnValue());
            } else {
                console.error('Error fetching recent accounts: ' + state);
            }
        });
        $A.enqueueAction(action);
    }
})
