params["", "", "_params"];
_params params ["_center"];

// Used objects array
private _objects = missionNamespace getVariable ["GSRI_CQB1_objects", []];

private _piles = nearestObjects [position _center, ["Land_Battery_F"], 17, true];
{
	private _group = createGroup [east, true];
	private _soldier = _group createUnit ["O_Soldier_F", getPos _x ,[],0,"CAN_COLLIDE"];
	_soldier disableAI "MOVE";
	_soldier setDir getDir _x;
	_objects pushBack _soldier;
	systemChat str getPos _soldier;
} forEach _piles;

missionNamespace setVariable ["GSRI_CQB1_objects", _objects];
missionNamespace setVariable ["GSRI_CQB1_started", true, true];
