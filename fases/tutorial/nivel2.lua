-- Inicializando o Composer
local composer = require("composer")

-- Criando o objeto da cena
local scene = composer.newScene()

local switch = false
 
-- Variáveis para os grupos
 local groupMain
 local groupBack
 local groupFore

 -- Variáveis dos objetos
local backgroundImage

local quadrado_vermelho

local circulo_verde

-- Função de gerenciamento do touch
local function OnTouch(event)
	local obj = event.target
	local phase = event.phase
	local fit = false

	if ( "began" == phase ) then
    obj:toFront()
    
    -- Seta o foco no objeto
    display.currentStage:setFocus( obj )
    
    --[[ 
			Seta o foco do objeto para true, para que o objeto só seja movido se o
     	isFocus for true. Isto é necessário, pois eventos falso podem ser 
     	mandados para o objeto. Por exemplo, quando o usuário clica em outro
		 	lugar da tela e arrasta até o objeto.
		--]]
		obj.isFocus = true

		-- Armazena a posição inicial do objeto
		obj.x0 = event.x - obj.x
		obj.y0 = event.y - obj.y
		obj.yInicial = obj.y ---RESOLVE  O PROBLEMA DA VOLTA DA PEÇA
		obj.xInicial = obj.x
	elseif obj.isFocus then
		if ( "moved" == phase ) then
			-- Faz o objeto se mover
				obj.x = event.x - obj.x0
				obj.y = event.y - obj.y0

				if(fit == false) then 
					switch = true
				end
				
      -- Mostra gradualmente os traços do objeto, dependendo da pressão aplicada
				if ( event.pressure ) then
					obj:setStrokeColor( 1, 1, 1, event.pressure )
				end
		elseif ( "ended" == phase or "cancelled" == phase ) then

			-- Interrompe o foco no objeto
			display.currentStage:setFocus( nil )
			obj.isFocus = false

			obj:setStrokeColor( 1, 1, 1, 0 )
		end
	end
	return true
end

 
-- Função create()
--[[
	Esta função é a parte onde criaremos os objetos e/ou imagens que farão parte
	da cena.Ela só é executada UMA vez, pois a cena será criada e armazenada na
	memória do composer. Essa função só será chamada denovo caso esta
	cena seja deletada da memória do composer, pois caso ela venha a ser usada
	novamente, este evento terá que criá-la novamente.
]]
function scene:create( event )
		local sceneGroup = self.view
		print("tutorialNivel2 Create Function")

		-- Inicizalizando os grupos
		groupMain = display.newGroup();
		groupBack = display.newGroup();
		groupFore = display.newGroup();

		-- Garantindo que os grupos Back e Front estejam sempre atrás e na frente, respectivamente.
		groupBack:toBack()
		groupFore:toFront()

		-- Inserindo os grupos no objeto da cena
		sceneGroup:insert(groupMain)
		sceneGroup:insert(groupBack)
		sceneGroup:insert(groupFore)

		-- Criando o background e botando no grupo do Background
		backgroundImage = display.newImageRect(groupBack,"images/background.jpg", 570 , 360)
		backgroundImage.x = display.contentCenterX
		backgroundImage.y = display.contentCenterY
----------------------------------------------------------------------------------------------------------------------
		-- Criando peças de encaixe e colocando no grupo do Foreground
		quadrado_vermelho = display.newImageRect(groupFore,"images/figuras/quadrado_vermelho.png", 83.59, 83.59)
    quadrado_vermelho.x = display.contentCenterX + 130
		quadrado_vermelho.y = display.contentCenterY - 80
		quadrado_vermelho.alpha = 0.3
  
		circulo_verde = display.newImageRect(groupFore,"images/figuras/circulo_verde.png", 93.59, 93.59)
    circulo_verde.x = display.contentCenterX + 130
		circulo_verde.y = display.contentCenterY + 70
		circulo_verde.alpha = 0.3
------------------------------------------------------------------------------------------------------------------------
		--Criando peças soltas e colocando no grupo do Foreground
		quadrado_vermelho = display.newImageRect(groupFore,"images/figuras/quadrado_vermelho.png", 83.59, 83.59)
    quadrado_vermelho.x = display.contentCenterX - 160
		quadrado_vermelho.y = display.contentCenterY - 80
		quadrado_vermelho:addEventListener("touch", OnTouch)
  
		circulo_verde = display.newImageRect(groupFore,"images/figuras/circulo_verde.png", 93.59, 93.59)
    circulo_verde.x = display.contentCenterX - 160
		circulo_verde.y = display.contentCenterY + 70
		circulo_verde:addEventListener("touch", OnTouch)
end
-- Função show()
--[[
	Esta função mostrará os objetos na cena. Possui a fase Will e a fase Did.
	Na fase Will, os objetos ainda estarão sendo introduzidos na cena, então é
	a fase onde iremos resetar posições, valores de variáveis e afins. Na fase Did
	é onde faremos o funcionamento da cena, pois ela já está preparada para ser
	usada.
]]
function scene:show( event )
    local sceneGroup = self.view
		local phase = event.phase
		
		print("tutorialNivel2 Show Function")

		if ( phase == "will" ) then
			print("tutorialNivel2 Show Phase Will")
		elseif ( phase == "did" ) then
			print("tutorialNivel2 Show Phase Did")
    end
end
 
-- Função hide()
--[[
	Esta função é chamada quando vamos para outra cena. Assim como a função show,
	esta função possui a fase Will e a fase Did. Na fase Will, devemos parar
	qualquer tipo de música ou transição que tiver sido introduzida na cena
	anteriormente, é a preparação para a cena desaparecer. Na fase Did, a cena já
	desapareceu e o composer guardará a cena na memória por padrão, pois ele
	assume que ela será usada outras vezes.
]]
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
	
		print("tutorialNivel2 Hide Function")

		if ( phase == "will" ) then
			print("tutorialNivel2 Hide Phase Will")
		elseif ( phase == "did" ) then
			print("tutorialNivel2 Hide Phase Did")
		end	
end
 
-- Função destroy()
--[[
	Esta é a função que destrói a cena, removendo os objetos presentes nela. 
	Também é a melhor hora para desfazer alguma coisa que você tenha feito na
	função de create, por exemplo, excluir alguma variável de referência para 
	o áudio da cena.
]]
function scene:destroy( event )
	print("tutorialNivel2 Destroy Function")

	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
return scene