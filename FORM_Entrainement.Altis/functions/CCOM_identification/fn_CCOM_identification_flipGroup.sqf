params[
	["_envId", ""],
	["_classId", ""],
	["_groupId", ""],
	["_forceHideMode", nil]
];

private _CCOM_env = missionNamespace getVariable "CCOM_Identification";

private _objects = _CCOM_env get _envId get _classId get _groupId;
private _isToHide = !isObjectHidden(_objects#0);
if(!isNil "_forceHideMode") then {_isToHide = _forceHideMode};
{
	_x hideObjectGlobal _isToHide;
} forEach _objects;