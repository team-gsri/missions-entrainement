
	params ["_user" ];
	_pileCQB1 = nearestObjects [ position cone_cqb_1, ["Land_Battery_F"], 17, true];
	{
		[position _x, getDir _x] call tyypal_fnc_agrougrou;
	} forEach _pileCQB1; 
	_FinExercice = 
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_soldatCQB1 = nearestObjects [ position cone_cqb_1, ["O_Soldier_F"], 17, true];
		{
			deleteVehicle _x;
			
		} forEach _soldatCQB1;
		player removeAction _actionId;
	};
	_user addAction ["Fin d'exercice", _FinExercice , nil, 100, false, false,"","true",2,false,"",""];

	hint "Exercice lancé";
