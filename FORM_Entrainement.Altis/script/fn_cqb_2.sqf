
	params ["_user" ];
	_pileCQB2 = nearestObjects [ position cone_cqb_2, ["Land_Battery_F"], 53, true];
	{
		[position _x, getDir _x] call tyypal_fnc_agrougrou;
	} forEach _pileCQB2; 
	_FinExercice = 
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_soldatCQB2 = nearestObjects [ position cone_cqb_2, ["O_Soldier_F"], 53, true];
		{
			deleteVehicle _x;
			
		} forEach _soldatCQB2;
		player removeAction _actionId;
	};
	_user addAction ["Fin d'exercice", _FinExercice , nil, 100, false, false,"","true",2,false,"",""];

	hint "Exercice lancé";