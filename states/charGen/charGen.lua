require("states/charGen/charGenWindow")

if passvar[1]=="true" then
  love.keyboard.setKeyRepeat(true) -- so keys may be held
  zoom = 1
  cGenW = charGenWindow:new()
  consoleBG = love.graphics.newImage("img/GUI/guiConsole.png")
  centerX = love.graphics.getWidth( ) / 2 / zoom
  centerY = love.graphics.getHeight( ) / 2 / zoom
  debug  = "debug"
  debug2 = "debug2"
end

function love.resize(w, h)
  zoomW = w/1920 * 1
  zoomH =h/1080 * 1
  zoom = (zoomW+zoomH) / 2
  centerX = love.graphics.getWidth( ) / 2 / zoom
  centerY = love.graphics.getHeight( ) / 2 / zoom

  debug = (tostring(zoom))
  debug2 = (tostring(zoomH))
end

function love.mousepressed(x, y, button, istouch)
	cGenW.nameLabel:clicked(x,y, zoom)
end

function love.keypressed(key)
    if key == "backspace" then
        cGenW.nameLabel:deleting()
    end
end

function love.textinput(t)
	cGenW.nameLabel:typing(t)
end

function love.mousemoved(x, y, dx, dy)
	cGenW:mouseMove(x,y,zoom)
	debug = (tostring(y))
	debug2 = (tostring(x))
end

function love.draw()
  sX = centerX-(cGenW.BG:getWidth()/2)
  sY = centerY-centerY*0.95
  love.graphics.scale(zoom)
  love.graphics.setBackgroundColor( 20, 20, 20 )
  love.graphics.print(debug,10,10)
  love.graphics.print(debug2,10,30)

  cGenW:draw(sX,sY)

  love.graphics.draw(consoleBG, centerX, centerY+centerY*1.05, 0, 1, 1, consoleBG:getWidth() / 2,consoleBG:getHeight())

end
