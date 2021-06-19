
 params ["_position", "_direction"];  
 _group = createGroup [east, true]; 
 _unit = _group createUnit ["O_Soldier_F", _position ,[],0,"CAN_COLLIDE"]; 
 _unit disableAI "MOVE"; 
 _unit setDir _direction;    
