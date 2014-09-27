

/*
	File: fn_copLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
	if(__GETC__(life_coplevel) == 1) then
	{
		player addUniform "U_Rangemaster";
		player addVest "V_Rangemaster_belt";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
	};
	
	if(__GETC__(life_coplevel) > 1) then
	{
		player addUniform "U_B_CombatUniform_mcam_tshirt";
		player addVest "V_TacVest_blk_POLICE";
		player addMagazine "100Rnd_65x39_caseless_mag";
		player addMagazine "100Rnd_65x39_caseless_mag";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addWeapon "arifle_MX_SW_Black_F";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
	};

[] call life_fnc_saveGear;

