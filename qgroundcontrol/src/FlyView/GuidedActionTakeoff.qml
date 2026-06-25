import QGroundControl
import QGroundControl.FlyView

GuidedToolStripAction {
    text:       _guidedController.takeoffTitle
    iconSource: "/res/takeoff.svg"
    visible:    _guidedController.showTakeoff || !_guidedController.showLand
    enabled:    _guidedController.showTakeoff
    actionID:   _guidedController.actionTakeoff

    // STRATUM: takeoff opens a dedicated altitude + launch-caution dialog instead of
    // the inline slide-to-confirm bar used by the other guided actions.
    onTriggered: _guidedController.showTakeoffDialog()
}
