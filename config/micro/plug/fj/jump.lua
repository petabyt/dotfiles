local config = import("micro/config")
local shell = import("micro/shell")
local micro = import("micro")

function init()
	config.MakeCommand("fj", jumptagCommand, config.NoComplete)
end

function jumptagCommand(bp, args)
	if #args == 0 then
		micro.InfoBar():Message("You are on line: " .. string.format("%x", bp.Cursor.Y))
		return
	else
		bp.Cursor.Y = tonumber(args[1], 16)
		bp.Cursor:Relocate()
		bp.Cursor.LastVisualX = bp.Cursor:GetVisualX()
	end
end
