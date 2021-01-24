-- carrot heheheehheehehe
-- you have to know how to use CC to use this..... lol
MonitorSide = "bottom"
Monitor = peripheral.wrap(MonitorSide)
LatestMessage = ""
TouchX = 0
TouchY = 0
 
-- waits until a monitor_touch event occours then sets the coords
function WaitForMonitorTouch()
    local event, side, x, y = os.pullEvent("monitor_touch")
    TouchX = x
    TouchY = y
    LatestMessage = "monTouch"
end
 
-- Called when a player right clicks/touches a monitor
function MonitorTouched()
    local x = TouchX
    local y = TouchY
 
    -- add code with x, y coords of where the monitor was touched
 
    return
end
 
-- Main Loop code
function LoopCode()
    while true do
 
        -- Code to be looped
 
        os.sleep(1)
    end
end
 
-- main function run first
function Main()
    while true do
        -- runs these 2 functions at the same time... i think
        -- and when one of them returns, the other does too and
        -- then the if statement below is executed. then goes back
        -- to the start running the parallel, etc.
        parallel.waitForAny(LoopCode, WaitForMonitorTouch)
 
        -- dont technically need this if statement, you could just
        -- run the MonitorTouched function, but eh. this just ensures
        -- that the monitor was 100% touched
        if (LatestMessage == "monTouch") then
            LatestMessage = "none"
            MonitorTouched()
        end
    end
end
 
Main()
