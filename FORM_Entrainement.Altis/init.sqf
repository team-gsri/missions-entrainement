_id1 = moniteur1 addAction ["",{[15,(_this select 0)] spawn fnc_stand01},nil,1.5,true,true,"","true",5];
moniteur1 setUserActionText [_id1 , "Serie de 15","<img size='2' color='#33BEFF' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\interact_ca.paa'/>Serie de 15"];


panneau_cqb1 addAction ["Début exercice", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	[_caller] spawn tyypal_fnc_cqb_1;
	}, nil,100,false,false,"","true",2,false,"",""];


panneau_cqb2 addAction ["Début exercice", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	[_caller] spawn tyypal_fnc_cqb_2;
	}, nil,100,false,false,"","true",2,false,"",""];

