// Instantly kill certain units when they fall unconscious
["ace_unconscious", {
    params["_unit", "_isUnconscious"];
    if(_isUnconscious && _unit getVariable ["GSRI_CQB1_deathIfUnconscious", false]) then {
        [_unit, "Harakiri, shame of being unconscious", _unit] call ace_medical_status_fnc_setDead;
    };
}] call CBA_fnc_addEventHandler;

// Properly set CQB1 lights
{
    _x#0 attachTo [cqb1_abri1, _x#1];
    _x#0 setVectorDirAndUp [[0,0,1], [0,-1,0]];
} forEach [
    [cqb1_red1, [-0.42,-0.74,1.13]],
    [cqb1_red2, [0.44,-0.74,1.13]],
    [cqb1_green1, [-0.42,-0.74,1.13]],
    [cqb1_green2, [0.44,-0.74,1.13]]
];
{ _x hideObjectGlobal true } forEach [cqb1_red1,cqb1_red2];
// Flip alert lights
["GSRI_CQB1_activation", { { _x hideObjectGlobal !(isObjectHidden _x) } forEach [cqb1_red1, cqb1_red2, cqb1_green1, cqb1_green2] }] call CBA_fnc_addEventHandler;

[po_1] call GSRI_fnc_CCOM_initPO;
[po_2] call GSRI_fnc_CCOM_initPO;