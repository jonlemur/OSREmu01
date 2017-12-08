diceButton = {}
diceButton.__index = diceButton


function diceButton:new()
	local dB = {}
	setmetatable(dB, diceButton)
  dB.image = love.graphics.newImage("img/GUI/btnDice.png")
  dB.result = 0
	dB.x = 0
	dB.y = 0
	dB.mx=0
	dB.my =0
	dB.scale = 1
	return dB
end

function diceButton:mouseMove(x,y,zoom)
	local posX = 0
	posX = self.x *zoom
	local posY = 0
	posY = self.y*zoom
	self.mx = x
	self.my = y
	if self.mx>posX-32 and self.mx<posX+32 then
		if self.my>posY-32 and self.my<posY+32 then
			self.scale=0.95
		else
			self.scale = 1
		end
	else
		self.scale=1
	end

end

function diceButton:draw(x,y)
  love.graphics.draw(self.image,x,y, 0, self.scale, self.scale, 32, 32)
	self.x = x
	self.y = y
end
