- set FM_dll to name of DLL with EFM, or nil to use SFM
--EDITING THIS FILE WILL CAUSE THE EFM TO FAIL.

local AFMenabled = true

bin = {}

if AFMenabled == true then
	bin = {'X1'} 
end


local self_ID="X1"
declare_plugin(self_ID,
{
installed 	 = true,
dirName	  	 = current_mod_path,
displayName  = _("X1"),

fileMenuName = _("X1"),
update_id        = "X1",
version		 = "1.1.1",	-- increment this number on the release branch. Use semantic versioning https://semver.org
state		 = "installed",
info		 = _("X1 aka \"Community A-4E\"\n\nThe A-4 is a lightweight, subsonic, single-engine attack aircraft. Entering service in 1956, it was designed to deliver conventional and nuclear weapons in daytime visual flight conditions.  However, using the APG-53(A) radar first installed on the A-4C, the A-4 is capable of all-weather navigation at low altitudes, as well as limited computer-assisted weapon delivery."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
binaries	 = bin,

Skins	=
	{
		{
			name	= _("X1"),
			dir		= "Skins/1"
		},
	},
Missions =
	{
		{
			name		= _("X1"),
			dir			= "Missions",
			--CLSID		= "{CLSID5456456346CLSID}",
		},
	},
LogBook =
	{
		{
			name		= _("X1"),
			type		= "X1",
		},
	},
InputProfiles =
	{
		["X1"]     = current_mod_path .. '/Input',
	},
Options =
    {
        {
            name		= _("X1"),
            nameId		= "X1",
            dir			= "Options",
            CLSID		= "{X1 options}"
        },
    },

})---------------------------------------------------------------------------------------

-- mounting 3d model paths and texture paths

mount_vfs_texture_path	(current_mod_path.."/Skins/1/ME")	-- for simulator loading window
mount_vfs_model_path    (current_mod_path.."/Shapes")
mount_vfs_model_path    (current_mod_path.."/Cockpit/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures")
mount_vfs_texture_path  (current_mod_path.."/Textures")
mount_vfs_sound_path    (current_mod_path.."/Sounds")

-- Option Cockpit operationnel, HUD partiel
if AFMenabled == true then
	dofile(current_mod_path.."/Entry/Suspension.lua")
	local FM = 
	{
		[1] = self_ID,
		[2] = 'X1',
		center_of_mass = {-0.039, 0.0, 0.0}, --x=0.183, y=0.261
		moment_of_inertia = {10968, 39500, 35116, -1763.0}, --763 --xy = -5518 --xy = -1763
		--moment_of_inertia = {10968, 35116, 39500, -1763.0}, --763 --xy = -5518 --xy = -1763
		suspension = suspension
	}
	make_flyable('X1'	, current_mod_path..'/Cockpit/Scripts/', FM, current_mod_path..'/comm.lua')
else
	make_flyable('X1'	, current_mod_path..'/Cockpit/Scripts/', nil, current_mod_path..'/comm.lua')
end

dofile(current_mod_path..'/Weapons/A4E_Weapons.lua')
dofile(current_mod_path..'/X1.lua')
dofile(current_mod_path..'/UnitPayloads/A-4E-C.lua')

dofile(current_mod_path.."/Views.lua")
make_view_settings('X1', ViewSettings, SnapViews)



plugin_done()-- finish declaration , clear temporal data