require("Actions")
require("getScriptFilename")
fn = getScriptFilename()
vrjLua.appendToModelSearchPath(fn)

wiihelp = Transform{
	position={0,1.3,0},
	orientation=AngleAxis(Degrees(-90), Axis{0.0,0.0,0.0}),
	scale=.5,
	Model([[../../Hogwarts Models/OSG/Room of Requirement/wiimote.ive]]),
}

Actions.addFrameAction(
	function()
		local wand = gadget.PositionInterface('VJWand')
		local device = gadget.DigitalInterface("WMButton2")
		while true do
			repeat
				Actions.waitForRedraw()
			until device.justPressed
				--Turn off Light on Object
				ss = wiihelp:getOrCreateStateSet()
				ss:setMode(0x0B50,osg.StateAttribute.Values.OFF)
				RelativeTo.Room:addChild(wiihelp)
			repeat
				Actions.waitForRedraw()
			until device.justPressed
				RelativeTo.Room:removeChild(wiihelp)
		end
	end
)