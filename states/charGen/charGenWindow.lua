charGenWindow = {}
charGenWindow.__index = charGenWindow

require("states/charGen/diceButton")
require("lib/textField")

function charGenWindow:new(x,y)
	local dB = {}
	setmetatable(dB, charGenWindow)
  dB.BG = love.graphics.newImage("img/GUI/sheetFrame.png")
  dB.GUI = love.graphics.newImage("img/GUI/charGen_GUI.png")
  dB.strButton = diceButton:new()
	dB.intButton = diceButton:new()
	dB.wisButton = diceButton:new()
  dB.nameLabel = textField:new("Name",45, 320, 60, 14)
	dB.temp = 0
	dB.strength = 0
	return dB
end

function charGenWindow:mouseMove(x,y, zoom)

	self.strButton:mouseMove(x,y,zoom)
	self.intButton:mouseMove(x,y,zoom)
	self.wisButton:mouseMove(x,y,zoom)
end

function charGenWindow:mClick(x,y,zoom)
	self.nameLabel:clicked(x,y, zoom)
	if self.strButton.mouseOver then
		self.strength = self.strButton:clicked()
		print (self.strength)
	end
end


function charGenWindow:draw(x,y)
  love.graphics.draw(self.BG,x,y)
  love.graphics.draw(self.GUI,x+80,y+150)
  self.strButton:draw(x+530,y+435)
	self.intButton:draw(x+530,y+496)
	self.wisButton:draw(x+530,y+557)
  self.nameLabel:draw(x+470, y+40)
	love.graphics.print((tostring(self.strength)),x+ 380, y+410)
end
