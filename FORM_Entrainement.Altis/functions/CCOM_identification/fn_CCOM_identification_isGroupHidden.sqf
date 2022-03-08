params[
	["_envId", ""],
	["_classId", ""],
	["_groupId", ""]
];

private _CCOM_env = missionNamespace getVariable "CCOM_Identification";

private _objects = _CCOM_env get _envId get _classId get _groupId;

isObjectHidden(_objects#0);