// Instantly kill certain units when they fall unconscious
["ace_unconscious", {
	params["_unit", "_isUnconscious"];
	if(_isUnconscious && _unit getVariable ["GSRI_CQB1_deathIfUnconscious", false]) then {
		[_unit, "Harakiri, shame of being unconscious", _unit] call ace_medical_status_fnc_setDead;
	};
}] call CBA_fnc_addEventHandler;
