/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	
	Description:
	Removes the players weapons client side
*/
removeAllWeapons player;
if (uniform player in ["U_Rangemaster","U_B_CTRG_3"]) then {removeUniform player;};
if (vest player in ["V_TacVest_blk_POLICE","V_TacVest_blk","V_PlateCarrier1_blk"]) then {removeVest player;};
if (headgear player in ["H_MilCap_blue","H_MilCap_gry","H_Beret_blk_POLICE","H_Beret_Colonel","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B"]) then {removeHeadgear player;};
if (backpack player in ["B_Bergen_blk","B_Kitbag_mcamo_Eng"]) then {removeBackpack player;};

license_civ_gun = false;
license_civ_vigilante = false;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_ephedra > 0) then {[false,"ephedra",life_inv_ephedra] call life_fnc_handleInv;};
if(life_inv_ziptie > 0) then {[false,"ziptie",life_inv_ziptie] call life_fnc_handleInv;};
if(life_inv_frog > 0) then {[false,"frog",life_inv_frog] call life_fnc_handleInv;};
if(life_inv_frogp > 0) then {[false,"frogp",life_inv_frogp] call life_fnc_handleInv;};
if(life_inv_methu > 0) then {[false,"methu",life_inv_methu] call life_fnc_handleInv;};
if(life_inv_crystalmeth > 0) then {[false,"crystalmeth",life_inv_crystalmeth] call life_fnc_handleInv;};
if(life_inv_mashu > 0) then {[false,"mashu",life_inv_mashu] call life_fnc_handleInv;};
if(life_inv_moonshine > 0) then {[false,"moonshine",life_inv_moonshine] call life_fnc_handleInv;};
if(life_inv_mmushroom > 0) then {[false,"mmushroom",life_inv_mmushroom] call life_fnc_handleInv;};
if(life_inv_mmushroomp > 0) then {[false,"mmushroomp",life_inv_mmushroomp] call life_fnc_handleInv;};


[] call life_fnc_civFetchGear;
[] call SOCK_fnc_updateRequest;
[] call life_fnc_civLoadGear;
titleText["The Illegal issued gear on your personnel has been seized.","PLAIN"];