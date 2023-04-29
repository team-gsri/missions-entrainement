player call GSRI_fnc_gearAsRegular;
private _lockers = nearestObjects [position quartiers, ["plp_ct_LockerBig"], 50, true];
{
    [_x] call GSRI_fnc_setAsLocker;
} forEach _lockers;

[cqb_arsenal] call GSRI_fnc_setAsLocker;

private _actionStartCQB1 = [
    "startCQB1",
    localize "GSRI_Entrainement_CQB1_start",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa",
    {_this remoteExec ["GSRI_fnc_CQB1_init", 2]},
    {!(missionNamespace getVariable ["GSRI_CQB1_started", false])},
    {},
    [cone_cqb_1]
] call ace_interact_menu_fnc_createAction;

private _actionEndCQB1 = [
    "endCQB1",
    localize "GSRI_Entrainement_CQB1_stop",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa",
    {[] remoteExec ["GSRI_fnc_CQB1_end", 2]},
    {(missionNamespace getVariable ["GSRI_CQB1_started", false])},
    {}
] call ace_interact_menu_fnc_createAction;

[controle_cqb1, 0, ["ACE_MainActions"], _actionStartCQB1] call ace_interact_menu_fnc_addActionToObject;
[controle_cqb1, 0, ["ACE_MainActions"], _actionEndCQB1] call ace_interact_menu_fnc_addActionToObject;

// First CQB1 camera call + action to debug it if needed.
[] call GSRI_fnc_CQB1_camInit;
private _actionReinitFeed = [
    "reinitFeed",
    localize "GSRI_Entrainement_CQB1_unfuckCam",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa",
    {[] call GSRI_fnc_CQB1_camInit},
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

// Teleport unconscious player back to tent and heal them
["ace_unconscious", {
    params["_unit", "_isUnconscious"];
    if(_isUnconscious && _unit == player && _unit distance cone_cqb_1 < 30) then {
        player setPos [15140.3,17298,0];
        [player, player] call ace_medical_treatment_fnc_fullHeal;
    };
}] call CBA_fnc_addEventHandler;
