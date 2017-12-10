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
	dB.mouseOver = false
	dB.scale = 1
	dB.result = 100
	dB.rolled = false
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
			self.mouseOver = true
		else
			self.scale = 1
			self.mouseOver = false
		end
	else
		self.scale=1
		self.mouseOver = false
	end
end


function diceButton:clicked()
	if self.mouseOver == true then
		if self.rolled == false then
			self.rolled = true
			local d1 = love.math.random( 1, 6)
			local d2 = love.math.random( 1, 6)
			local d3 = love.math.random( 1, 6)
			self.result = d1 + d2 + d3
		end
	end
	return self.result
end

function diceButton:draw(x,y)
  love.graphics.draw(self.image,x,y, 0, self.scale, self.scale, 32, 32)
	self.x = x
	self.y = y
end
