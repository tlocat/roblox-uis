local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/tlocat/roblox-uis/refs/heads/main/Splix/src'))()
local Window = Library:Window({Name = "bitchbot.crack | ui", Amount = 6})
local Watermark = Library:Watermark({Name = "watermark | $portal$ | private"})
local Indicator = Library:Indicator({Name = "New Indicator"})
-- Indicator Options
local TextIndicator = Indicator:NewValue({Name = "New Text", Value = "value here"})
local BarIndicator = Indicator:NewBar({Name = "New Bar", Value = 10, Min = 0, Max = 100})
--
local Page = Window:Page({Name = "Legit", Weapons = true})
Window:Page({Name = "Rage"})
Window:Page({Name = "Visuals"})
Window:Page({Name = "Misc"})
local Players = Window:Page({Name = "Players"})
local Settings = Window:Page({Name = "Settings"})
--
local SubPage1 = Page:Weapon({})
local SubPage2 = Page:Weapon({Icon = "rbxassetid://16997762295"})
SubPage2:PlayerList({})
--
local Section = SubPage1:Section({Name = "New Section"})
local Section2 = SubPage1:Section({Name = "New Section", Side ="Right"})
SubPage1:Section({Name = "wave is detected"})
--
Section:Toggle({Name = "Toggle Indicator", Callback = function(State) Indicator:SetVisible(State) end}):Colorpicker({Default = Color3.new(0,1,0)})
Section:Slider({Suffix = "%"})
Section:Toggle({Name = "type shi"}):Keybind({Name = "key", Default = Enum.KeyCode.E})
Section:Slider({Name = "update indicator bar", Min = 0, Max = 100, Default = 10, Decimals = 1, Callback = function(State) BarIndicator:UpdateValue(State) end})
Section:List({Name = "list", Options = {"1","2","3","4"}, Default = "1"})
Section:List({Name = "multilist", Options = {"1","2","3","4"}, Default = {"1"}, Max = 4})
Section:Colorpicker({Name = "color"})
Section:Keybind({Name = "key", Default = Enum.KeyCode.E})
--
local toggle = Section2:Toggle({Name = "fentanyl"})
toggle:Colorpicker({})
toggle:Colorpicker({})
Section2:List({Options = {"1","2","3","4"}, Default = {"1"}, Max = 4})
Section2:Textbox({Name = "textbox", Placeholder = "placeholder"})
Section2:Button({Name = "sub1"}):Button({Name = "sub2"})
Section2:Button({Name = "new notification", Callback = function(State) Library:Notification("testing lol", 5) end})
Section2:Divider({Name = "new divider"})
Section2:Label({Name = "new label omg"})
Section2:ListBox({Options = {"1","2","3","4","5","6","7"}, Default = "1", ScrollingMax = 5})
--
Players:PlayerList({})
--
do -- Settings
	local CFG = Settings:Section({Name = "Config", Zindex = 2})
	--
	local ConfigList = CFG:List({Name = "Config", Flag = "SettingConfigurationList", Options = {}})
	CFG:Textbox({Flag = "SettingsConfigurationName", Name = "Config Name"})
	--
	local CurrentList = {};
	local function UpdateConfigList()
		local List = {};
		for idx, file in ipairs(listfiles("Lunar/Configs")) do
			local FileName = file:gsub("Lunar/Configs\\", ""):gsub(".cfg", "")
			List[#List + 1] = FileName;
		end;

		local IsNew = #List ~= #CurrentList
		if not IsNew then
			for idx, file in ipairs(List) do
				if file ~= CurrentList[idx] then
					IsNew = true;
					break;
				end;
			end;
		end;

		if IsNew then
			CurrentList = List;
			ConfigList:Refresh(CurrentList);
		end;
	end;
	--
	CFG:Button({Name = "Create", Callback = function()
		local Success, Error = pcall(function()
			local ConfigName = Flags.SettingsConfigurationName;
			if ConfigName == "" or isfile("Lunar/Configs/" .. ConfigName .. ".cfg") then
				return;
			end;
			writefile("Lunar/Configs/" .. ConfigName .. ".cfg", "");
			UpdateConfigList();
		end)
	end}):Button({Name = "Save", Callback = function()
		local Success, Error = pcall(function()
			local SelectedConfig = Flags.SettingConfigurationList;
			if SelectedConfig then
				writefile("Lunar/Configs/" .. SelectedConfig .. ".cfg", Library:GetConfig())
			end;
		end);
	end})
	CFG:Button({Name = "Load", Callback = function()
		local Success, Error = pcall(function()
			local SelectedConfig = Flags.SettingConfigurationList;
			if SelectedConfig then
				Library:LoadConfig(readfile("Lunar/Configs/" .. SelectedConfig .. ".cfg"))
			end
		end)
	end}):Button({Name = "Delete", Callback = function()
		local SelectedConfig = Flags.SettingConfigurationList;
		if SelectedConfig then
			delfile("Lunar/Configs/" .. SelectedConfig .. ".cfg")
		end
		UpdateConfigList();
	end})
	CFG:Button({Name = "Refresh",Callback = function()
		UpdateConfigList();
	end})
	--
	CFG:Keybind({Name = "Menu Key", Flag = "MenuKey", UseKey = true, Default = Enum.KeyCode.End, Callback = function(State) Library.UIKey = State end})
	CFG:Colorpicker({Name = "Menu Accent", Flag = "MenuAccent", Default = Library.Accent, Callback = function(State) Library:ChangeAccent(State) end})
	CFG:Toggle({Name = "Show Watermark", Flag = "Watermark", Callback = function(State) Watermark:SetVisible(State) end})
	CFG:Textbox({Flag = "WatermarkText", Name = "Watermark Text", State = "watermark | $portal$ | private", Callback = function(State) Watermark:UpdateText(State) end})
	UpdateConfigList();
end
