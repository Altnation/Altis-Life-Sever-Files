/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Vehicular Manslaughter",15000]};
	case "187": {_type = ["Manslaughter",50000]};
	case "901": {_type = ["Escaping Jail",25000]};
	case "261": {_type = ["Rape",20000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Attempted Rape",30000]};
	case "215": {_type = ["Attempted Auto Theft",10000]};
	case "213": {_type = ["Use of illegal explosives",10000]};
	case "207": {_type = ["Kidnapping",15000]};
	case "207A": {_type = ["Attempted Kidnapping",5000]};
	case "487": {_type = ["Grand Theft",15000]};
	case "488": {_type = ["Petty Theft",1500]};
	case "480": {_type = ["Hit and run",10000]};
	case "481": {_type = ["Drug Possession",15000]};
	case "482": {_type = ["Intent to distribute",45000]};
	case "483": {_type = ["Drug Trafficking",25000]};
	case "459": {_type = ["Burglary",30000]};
	case "211A": {_type = ["Attempted Robbery",20000]};
	case "211": {_type = ["Robbery", 50000]};
	
	  case "1": {_type = ["Driving Without a License",1500]};
    case "2": {_type = ["Attempted theft of a vehicle",3500]};
    case "3": {_type = ["Grand Theft Auto",5000]};
    case "4": {_type = ["Driving Without Lights",350]};
    case "5": {_type = ["Excessive Speed",3500]};
    case "6": {_type = ["Dangerous Driving",2500]};
    case "7": {_type = ["Attempted Theft of a Police Vehicle",7500]};
    case "8": {_type = ["Theft of a Police Vehicle",20000]};
    case "9": {_type = ["Landing in a no fly zone",2500]};
    case "10": {_type = ["Driving of an illegle vehicle",10000]};
    case "11": {_type = ["Hit and Run",5000]};
    case "12": {_type = ["Fleeing the police/evading",7500]};
    case "13": {_type = ["Running Over A Person",25000]};
    case "14": {_type = ["Possession of illegle items",5000]};
    case "15": {_type = ["Resisting Arrest",15000]};
    case "16": {_type = ["Not Following Police Orders",5000]};
    case "17": {_type = ["Insulting Behaviour",2500]};
    case "18": {_type = ["Insulting the police",8000]};
    case "19": {_type = ["Entering the Police HQ",5000]};
    case "20": {_type = ["Murder on Police",25000]};
    case "21": {_type = ["Bombardment on Police/Officials/Properties",15000]};
    case "22": {_type = ["Destruction of police property",15000]};
    case "23": {_type = ["Possession of an illegle substance",12000]};
    case "24": {_type = ["Possession of a Firearm Without License",5000]};
    case "25": {_type = ["Weapon on Show in City Limits",2500]};
    case "26": {_type = ["Possession of an illegle Firearm",10000]};
    case "27": {_type = ["illegle firearm in the city",10000]};
    case "28": {_type = ["Taking of a Hostage",30000]};
    case "29": {_type = ["Attack on a person or a vehicle",10000]};
    case "30": {_type = ["Bank Robbery",200000]};
    case "31": {_type = ["Murder",60000]};
    case "32": {_type = ["Uprising",35000]};
    case "33": {_type = ["Attack By Rebel Personnel",35000]};
    case "34": {_type = ["Attack or siege of the cities",25000]};
    case "35": {_type = ["Landing in a no fly zone",1500]};
    case "36": {_type = ["flying/hovering below 150m above city",2000]};
    case "37": {_type = ["Escaping Jail",25000]};
    case "38": {_type = ["Flying without a pilots License",1200]};
    case "39": {_type = ["Excessive horn tooting",1000]};
    case "40": {_type = ["Drug Dealing",25000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};