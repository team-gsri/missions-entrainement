params[
	["_envId", ""],
	["_classId", ""],
	["_groupId", ""]
];

systemChat str _this;

private _CCOM_env = missionNamespace getVariable "CCOM_Identification";

// Easy way, flipping a group.
if(_groupId != "") then {
	[_envId, _classId, _groupId] call GSRI_fnc_CCOM_identification_flipGroup;
} else {
	// Less easy, flipping a class.
	if(_classId != "") then {
		private _isClassMainlyHidden = [_envId, _classId] call GSRI_fnc_CCOM_identification_isClassHidden;
		private _groupIds = keys (_CCOM_env get _envId get _classId);
		{
			[_envId, _classId, _x, !_isClassMainlyHidden] call GSRI_fnc_CCOM_identification_flipGroup;
		} forEach _groupIds;
	} else {
		// Harder, flipping an entire environnment.
		if(_envId != "") then {
			private _classIds = keys (_CCOM_env get _envId);
			private _areHiddenClass = _classIds apply {[_envId, _x] call GSRI_fnc_CCOM_identification_isClassHidden};
			private _isEnvMainlyHidden = ({_x == true} count _areHiddenClass >= count _areHiddenClass / 2);
			{
				private _groupIds = keys (_CCOM_env get _envId get _x);
				private _classId = _x;
				{
					[_envId, _classId, _x, !_isEnvMainlyHidden] call GSRI_fnc_CCOM_identification_flipGroup;
				} forEach _groupIds;
			} forEach _classIds;
		};
	};
};