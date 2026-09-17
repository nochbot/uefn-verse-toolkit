using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Simple reusable controller for showing and hiding groups of props.
prop_visibility_device := class(creative_device):

    @editable
    ShowButton:button_device = button_device{}

    @editable
    HideButton:button_device = button_device{}

    @editable
    Props:[]creative_prop = array{}

    OnBegin<override>()<suspends>:void=
        ShowButton.InteractedWithEvent.Subscribe(OnShowPressed)
        HideButton.InteractedWithEvent.Subscribe(OnHidePressed)

    OnShowPressed(Agent:agent):void=
        ShowAll()

    OnHidePressed(Agent:agent):void=
        HideAll()

    ShowAll():void=
        for (Prop : Props):
            if (Prop.IsValid[]):
                Prop.Show()

    HideAll():void=
        for (Prop : Props):
            if (Prop.IsValid[]):
                Prop.Hide()
