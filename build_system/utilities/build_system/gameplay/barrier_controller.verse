using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Controls multiple Barrier devices using open and close buttons.
barrier_controller := class(creative_device):

    @editable
    OpenButton:button_device = button_device{}

    @editable
    CloseButton:button_device = button_device{}

    @editable
    Barriers:[]barrier_device = array{}

    OnBegin<override>()<suspends>:void=
        OpenButton.InteractedWithEvent.Subscribe(OnOpenPressed)
        CloseButton.InteractedWithEvent.Subscribe(OnClosePressed)

    OnOpenPressed(Agent:agent):void=
        OpenBarriers()

    OnClosePressed(Agent:agent):void=
        CloseBarriers()

    OpenBarriers():void=
        for (Barrier : Barriers):
            Barrier.Disable()

    CloseBarriers():void=
        for (Barrier : Barriers):
            Barrier.Enable()
