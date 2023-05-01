_serie = _this select 0;
_moniteur = _this select 1;
_listeCible = [];
{_listeCible pushback _x} forEach lciblerdm;
{["animate",[_x,"down"]] call BIS_fnc_target} forEach _listeCible;
sleep 2;
[_moniteur,true] remoteExec ["hideObjectGlobal",2,false];
for "_i" from 1 to _serie do
{
	_listeCible = [];
	{_listeCible pushback _x} forEach lciblerdm;
	_cible1 = selectRandom _listeCible;
	_listeCible deleteAt (_listeCible find _cible1);
	_cible2 = selectRandom _listeCible;
	{["animate",[_x,"up"]] call BIS_fnc_target} forEach [_cible1,_cible2];
	sleep 2;
	{["animate",[_x,"down"]] call BIS_fnc_target} forEach lciblerdm;
	sleep 3;
};
[_moniteur,false] remoteExec ["hideObjectGlobal",2,false];