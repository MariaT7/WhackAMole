-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time,
-- the points increases by 1.

display.setStatusBar(display.HiddenStatusBar)


--Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)

	-- change the background colour
	display.setDefault ("background", 255/255, 192/255, 192/255)

	--Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

local pointsObject
local points = 0

--Creating Cub
local Cub = display.newImage( "Images/Cub.png" , 0, 0)

	-- setting Position
	Cub.x = display.contentCenterX
	Cub.y = display.contentCenterY

	Cub:scale(1, 1)

	Cub.isVisible = false

-- displays number of points 
pointsObject = display.newText("Points = 0", 120, 60, "Georgia", 50)
pointsObject:setTextColor(255/255, 205/255, 205/255)
pointsObject.isVisible = true


local function Points()
	-- tracks points
	points = points + 1
	pointsObject.text = "points=" .. points  
end
----------------------------------------Functions----------------------------------------------

-- This function that makes he Cub appear in a random (x,y) position on the screen
-- before calling the hidden function
local function PopUp( )

	-- Choosing Random Position on the screen between 0 and the size of the screen
	Cub.x = math.random( 0, display.contentWidth )
	Cub.y = math.random( 0, display.contentHeight )

	Cub.isVisible = true

	timer.performWithDelay(500, Hide)
end

-- This function increments the points only if the Cub is clicked. It then displays 
-- the new points.
local function Whacked( event )

	--If the phase just started 
	if (event.phase == "began") then
		points = points + 1
		pointsObject.text = "points : " .. points
	end
end

------------------------------------------Event Listeners -------------------------------------------
-- I add the event listener to the Cub so that if the Cub is touched, the Whacked function
-- is called
Cub:addEventListener( "event", Whacked)

------------------------------------------------Start the Game ---------------------------------------------
PopUp()
Whacked()