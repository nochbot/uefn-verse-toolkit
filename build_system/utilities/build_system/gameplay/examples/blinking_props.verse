using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

# Example utility that repeatedly hides and shows a collection of props.
blinking_props := class(creative_device):

    @editable
    Props:[]creative_prop = array{}

    @editable
    VisibleTime:float = 1.0

    @editable
    HiddenTime:float = 1.0

    OnBegin<override>()<suspends>:void=
        loop:
            ShowProps()
            Sleep(VisibleTime)

            HideProps()
            Sleep(HiddenTime)

    ShowProps():void=
        for (Prop : Props):
            if (Prop.IsValid[]):
                Prop.Show()

    HideProps():void=
        for (Prop : Props):
            if (Prop.IsValid[]):
                Prop.Hide()
