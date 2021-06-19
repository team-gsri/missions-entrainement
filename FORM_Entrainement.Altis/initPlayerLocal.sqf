player call GSRI_fnc_getEmpty;
private _lockers = nearestObjects [position quartiers, ["plp_ct_LockerBig"], 50, true];
{
	[_x] call GSRI_fnc_setAsLocker;
} forEach _lockers;