// Used objects array
private _objects = missionNamespace getVariable ["GSRI_CQB1_objects", []];

{
	deleteVehicle _x;
} forEach _objects;

missionNamespace setVariable ["GSRI_CQB1_objects", nil, true];
missionNamespace setVariable ["GSRI_CQB1_started", false, true];
