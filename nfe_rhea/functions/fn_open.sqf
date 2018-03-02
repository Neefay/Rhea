#include "../defines.hpp"

TRACE_1("fn_open: %1", _this);

private _mainDisplay = findDisplay getNumber (configFile >> "nfe_rhea_main" >> "idd");
if (!isNull _mainDisplay) then {
	_mainDisplay closeDisplay 0;
} else {
	private _loginDialog = uiNamespace getVariable ["nfe_rhea_loginDialog", displayNull];
	if (!isNull _loginDialog) then {
		_loginDialog closeDisplay 0;
	} else {
		private _missionDisplay = findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd");
		_missionDisplay createDisplay (if (isMultiplayer && !(player getVariable ["nfe_rhea_loggedIn", false])) then {
			"nfe_rhea_login"
		} else {
			"nfe_rhea_main"
		});
	};
};