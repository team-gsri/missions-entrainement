player call GSRI_fnc_getEmpty;
private _lockers = nearestObjects [position quartiers, ["plp_ct_LockerBig"], 50, true];
{
    [_x] call GSRI_fnc_setAsLocker;
} forEach _lockers;

[cqb_arsenal] call GSRI_fnc_setAsLocker;

private _actionStartCQB1 = [
    "startCQB1",
    "Start course",
    "",
    {_this remoteExec ["GSRI_fnc_CQB1_init", 2]},
    {!(missionNamespace getVariable ["GSRI_CQB1_started", false])},
    {},
    [cone_cqb_1]
] call ace_interact_menu_fnc_createAction;

private _actionEndCQB1 = [
    "endCQB1",
    "End course",
    "",
    {[] remoteExec ["GSRI_fnc_CQB1_end", 2]},
    {(missionNamespace getVariable ["GSRI_CQB1_started", false])},
    {}
] call ace_interact_menu_fnc_createAction;

[controle_cqb1, 0, ["ACE_MainActions"], _actionStartCQB1] call ace_interact_menu_fnc_addActionToObject;
[controle_cqb1, 0, ["ACE_MainActions"], _actionEndCQB1] call ace_interact_menu_fnc_addActionToObject;

private _actionReinitFeed = [
    "reinitFeed",
    "Reinit camera feed",
    "",
    {
        deleteVehicle feedbackcam_cqb1;
        feedback_cqb1 setObjectTexture [0, "#(argb,512,512,1)r2t(camfeed_cqb1,2.3)"];
        feedbackcam_cqb1 = "camera" camCreate getPosATL camera_cbq_individuel;
        feedbackcam_cqb1 camSetTarget cone_cqb_1;
        feedbackcam_cqb1 camSetFov 0.65;
        feedbackcam_cqb1 camCommit 0;
        feedbackcam_cqb1 cameraEffect ["Internal", "Back", "camfeed_cqb1"];
    },
    {true}
] call ace_interact_menu_fnc_createAction;
[controle_cqb1, 0, ["ACE_MainActions"], _actionReinitFeed] call ace_interact_menu_fnc_addActionToObject;

// Selective notifications for CQB1, only display notif if player is less than 30m away
["GSRI_CQB1_activation", {
    if(player distance cone_cqb_1 > 30) exitWith {};
    params["_activated"];
    private _description = ["GSRI_Entrainement_CQB1_deactivated", "GSRI_Entrainement_CQB1_activated"] select _activated;
    ["CQB1_activation", [localize "GSRI_Entrainement_CQB1", localize _description]] call BIS_fnc_showNotification;
}] call CBA_fnc_addEventHandler;
