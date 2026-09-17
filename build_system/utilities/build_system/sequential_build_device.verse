using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Reveals a group of props one after another.
# Useful for tycoon construction, upgrades, rooms and staged builds.
sequential_build_device := class(creative_device):

    @editable
    BuildButton:button_device = button_device{}

    @editable
    BuildProps:[]creative_prop = array{}

    @editable
    DelayBetweenProps:float = 0.15

    OnBegin<override>()<suspends>:void=
        HideBuildProps()
        BuildButton.InteractedWithEvent.Subscribe(OnBuildPressed)

    OnBuildPressed(Agent:agent):void=
        spawn{BuildSequence()}

    HideBuildProps():void=
        for (Prop : BuildProps):
            if (Prop.IsValid[]):
                Prop.Hide()

    BuildSequence()<suspends>:void=
        BuildButton.Disable()

        for (Prop : BuildProps):
            if (Prop.IsValid[]):
                Prop.Show()
                Sleep(DelayBetweenProps)

        BuildButton.Enable()
