player call GSRI_fnc_getEmpty;
private _lockers = nearestObjects [position quartiers, ["plp_ct_LockerBig"], 50, true];
{
	[_x] call GSRI_fnc_setAsLocker;
} forEach _lockers;

private _actionStartCQB1 = [
	"startCQB1",
	"Start course",
	"",
	{_this call GSRI_fnc_CQB1_init},
	{!(missionNamespace getVariable ["GSRI_CQB1_started", false])},
	{},
	[cone_cqb_1]
] call ace_interact_menu_fnc_createAction;

private _actionEndCQB1 = [
	"endCQB1",
	"End course",
	"",
	{[] call GSRI_fnc_CQB1_end},
	{(missionNamespace getVariable ["GSRI_CQB1_started", false])},
	{}
] call ace_interact_menu_fnc_createAction;

[panneau_cqb1, 0, ["ACE_MainActions"], _actionStartCQB1] call ace_interact_menu_fnc_addActionToObject;
[panneau_cqb1, 0, ["ACE_MainActions"], _actionEndCQB1] call ace_interact_menu_fnc_addActionToObject;
