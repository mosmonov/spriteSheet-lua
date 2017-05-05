local androidTable, androidSheet, sequenceData, androidSprite
local w = display.contentWidth
-- local h = display.contentHeight

androidTable = {
    width = 329,
    height = 241,
    numFrames = 28,
    sheetContentHeight = 723,
    sheetContentWidth = 3290
}


androidSheet = graphics.newImageSheet( "sh.png", androidTable )
sequenceData = {
{
 name = "jump",
 frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
 time = 500     
},
{
 name = "sit",
 frames = {4, 3, 2},
 time = 200,
 loopCount = 1
}    
}
androidSprite = display.newSprite(androidSheet, sequenceData)
androidSprite.x = w/2
androidSprite.y = 400
androidSprite.xScale = 2
androidSprite.yScale = 2

function sitAndStop()
    androidSprite:setSequence("sit")
    androidSprite:play()
end

function moveDroid(event)
    androidSprite:setSequence("jump")
    androidSprite:play()
    transition.to(androidSprite, 
    {y=event.y, x=event.x, time = 4000, onComplete=sitAndStop})
end
Runtime:addEventListener("touch", moveDroid)