
// this script was created by IMTZ

_captive = _this select 0;
_anim = selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"];

_captive setCaptive true;
removeAllWeapons _captive;
removeBackpack _captive;
removeVest _captive;
removeAllAssignedItems _captive;
_captive switchMove _anim;
if (_anim == "Acts_ExecutionVictim_Loop") then {
	_captive setDamage .5;
};
_captive disableAI "MOVE"; 
_captive disableAI "AUTOTARGET"; 
_captive disableAI "ANIM"; 
_captive allowFleeing 0; 
_captive setBehaviour "Careless"; 

// Add Hold Action to Free Hostage
[
				        _captive,
				"Libera Ostaggio",
				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
			"true",
			"true",
			{},
			{},
      	{
						        if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
								_this select 0 playMove "Acts_ExecutionVictim_Unbow";
							} else {
								_this select 0 switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
							};
							_complMessage = selectRandom ["Pensavo che sarei morto qui!","Grazie mille uomo.","Penso di essermi cagato addosso...","Ti posso abbracciare?","SONO VIVO.","Dove diavolo sono?"];
							["Hostage", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
							sleep 5.5;
							(_this select 0) enableAI "MOVE";
							(_this select 0) enableAI "AUTOTARGET";
							(_this select 0) enableAI "ANIM";
							(_this select 0) setBehaviour "SAFE";
							[(_this select 0)] joinSilent player;
							[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];

						},
       {
						_intrMessage = selectRandom ["EHI! Non voglio morire qui!","Non lasciarmi qui amico! Per favore!","STANNO MANGIANDO LE PERSONE. PORTAMI FUORI DI QUI.","**borbotta* merda merda merda...","Perfavore Wolf Salvami...."];
						["Hostage", _intrMessage] remoteExec ["BIS_fnc_showSubtitle"];
					    },
			    [_anim],
		    3,
			    0,
		    true,
		    false
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];


//this script was created by IMTZ