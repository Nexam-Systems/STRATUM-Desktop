import QGroundControl
import QGroundControl.Controls

ToolStripAction {
    property int    actionID
    property string message
    // STRATUM: optional payload forwarded to confirmAction (e.g. the target flight-mode
    // name for actionSetFlightMode). Undefined for actions that take no data.
    property var    actionData: undefined

    property var _guidedController: globals.guidedControllerFlyView

    onTriggered: {
        _guidedController.closeAll()
        _guidedController.confirmAction(actionID, actionData)
    }
}
