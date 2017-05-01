---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------
controller = {
  
    saida=""
}

function controller.getValor(event)
   if ( event.phase == "began" ) then
        local bt = event.target
        controller.saida = controller.saida..bt:getLabel()
        
        controller.result.text = controller.saida
    end
    
    return true
  
end

function controller.calcula(event)
   if ( event.phase == "began" ) then
        local bt = event.target
        
        local func = loadstring("return "..controller.saida)
        
        if(pcall(func)) then
          controller.result.text = tostring(func() or "0")
          controller.saida = tostring(func() or "")
        else
          controller.result.text = "Expressão mal formada"
          controller.saida = ""
        end  
        
    end
    
    return true
  
end

function controller.setZero(event)
   if ( event.phase == "began" ) then
     
        controller.result.text = "0"
        controller.saida = ""
    end
    
    return true
  
end





local viewLoader = require("view")
local view = viewLoader:setView("layout.xml",controller)
local composer = require( "composer" )
local color = require( "libs.convertcolor" )

-- Load scene with same root filename as this file
local scene = composer.newScene()

---------------------------------------------------------------------------------



function scene:create( event )
    local sceneGroup = self.view
    
    controller.result.text = "0"
    
    
    
   
    
    
    controller.btIgu:setFillColor(color.hex("272d25"))
    controller.btIgu:setStrokeColor(color.hex("ffffff"))
   
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )


---------------------------------------------------------------------------------


return scene
