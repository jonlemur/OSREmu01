textField = {}
textField.__index = textField

local utf8 = require("utf8")

-- Constructor
function textField:new(text,size, width, height, maxLenght)
	local tF = {}
	setmetatable(tF, textField)
	tF.x = 0
	tF.y = 0
	tF.width = width
	tF.height = height
	tF.showBG = showBG
	tF.text= text
	tF.defText=text
	tF.maxLenght = maxLenght
	tF.font = love.graphics.newFont("assets/LinLibertine_RZ.ttf", size)
	tF.font:setFilter( "nearest", "nearest", 1 )
	tF.selected = false
	return tF
end

function textField:typing(t)
	if self.text == self.defText then
		self.text = ""
	end

	if self.selected then
		if string.len(self.text)<self.maxLenght then
			self.text = self.text .. t
		end
	end

end

function textField:deleting()
        local byteoffset = utf8.offset(self.text, -1)

        if byteoffset and self.selected then
            self.text = string.sub(self.text, 1, byteoffset - 1)
        end
end


function textField:clicked(mouseX, mouseY, zoom)
	--width and height of the textfield
	local rBound = self.width
	local lBound = self.height
	rBound = rBound + self.x
	lBound = lBound + self.y

	local btnX = self.x
	btnX = btnX * zoom
	local btnY = self.y
	btnY = btnY * zoom

	rBound = rBound * zoom
	lBound = lBound * zoom

	if mouseX> btnX and mouseX<rBound then
		if mouseY> btnY and mouseY<lBound then
			self.selected = true
		else
			self.selected = false
			if self.text=="" then
				self.text=self.defText
			end
		end
	else
		self.selected = false
		if self.text=="" then
			self.text=self.defText
		end
	end
end


function textField:draw(x,y)
	self.x = x
	self.y = y
	love.graphics.setFont( self.font )

	if self.selected then
		love.graphics.setColor(30, 30, 30, 100)
	else
		love.graphics.setColor(30, 30, 30, 80)
	end

	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height )
	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.print(self.text, self.x+7,self.y-5)
end
