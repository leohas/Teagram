-- Inicializando o composer
local composer = require("composer")
 
-- Criando o objeto da cena
local scene = composer.newScene()

-- Variáveis para os grupos
 local groupMain
 local groupBack
 local groupFore
 local groupCat

 -- Variáveis dos objetos
local backgroundImage

local retangulo_verde
local retangulo_verde_encaixe

local triangulo_amarelo
local triangulo_amarelo_encaixe

local triangulo_rosa
local triangulo_rosa_encaixe

local triangulo_laranja
local triangulo_laranja_encaixe

local losango_roxo
local losango_roxo_encaixe

local triangulo_vermelho
local triangulo_vermelho_encaixe

local triangulo_azul
local triangulo_azul_encaixe

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
				print("movendo")

			-- Mostra gradualmente os traços do objeto, dependendo da pressão aplicada
			if ( event.pressure ) then
				obj:setStrokeColor( 1, 1, 1, event.pressure )
			end

		elseif ( "ended" == phase or "cancelled" == phase ) then
			if (fit == false) then
				obj.x = obj.xInicial
				obj.y = obj.yInicial
				print("voltei")
			end
			-- Interrompe o foco no objeto
			display.currentStage:setFocus( nil )
			obj.isFocus = false
			print("foco")
			
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
		print("gatoNivel3 Create Function")

		-- Inicizalizando os grupos
		groupMain = display.newGroup();
		groupBack = display.newGroup();
		groupFore = display.newGroup();
		groupCat = display.newGroup();

		-- Garantindo que os grupos Back e Front estejam sempre atrás e na frente, respectivamente.
		groupBack:toBack()
		groupFore:toFront()

		-- Inserindo os grupos no objeto da cena
		sceneGroup:insert(groupMain)
		sceneGroup:insert(groupBack)
		sceneGroup:insert(groupFore)

		-- Inserindo o grupo dos objetos do gato ao grupo do Front
		groupFore:insert(groupCat)

		-- Criando o background e botando no grupo do Background
		backgroundImage = display.newImageRect(groupBack,"images/background.jpg", 570 , 360)
		backgroundImage.x = display.contentCenterX
		backgroundImage.y = display.contentCenterY
----------------------------------------------------------------------------------------------------------------
		--Criando peças soltas e colocando no grupo do Foreground
		retangulo_verde = display.newImageRect(groupFore,"images/figuras/retangulo_verde.png", 98.2, 53  )
		retangulo_verde.x = display.contentCenterX - 130
		retangulo_verde.y = display.contentCenterY - 105
		retangulo_verde:addEventListener("touch", OnTouch)

		triangulo_amarelo = display.newImageRect(groupFore,"images/figuras/triangulo_amarelo.png", 69.5, 147.5  )
		triangulo_amarelo.x = display.contentCenterX - 150
		triangulo_amarelo.y = display.contentCenterY + 20
		triangulo_amarelo:addEventListener("touch", OnTouch)

		triangulo_rosa = display.newImageRect(groupFore,"images/figuras/triangulo_rosa.png", 34.7, 75  )
		triangulo_rosa.x = display.contentCenterX - 240
		triangulo_rosa.y = display.contentCenterY - 105
		triangulo_rosa:addEventListener("touch", OnTouch)

		triangulo_laranja = display.newImageRect(groupFore,"images/figuras/triangulo_laranja.png", 33.7, 74  )
		triangulo_laranja.x = display.contentCenterX - 95
		triangulo_laranja.y = display.contentCenterY - 20
		triangulo_laranja:addEventListener("touch", OnTouch)

		losango_roxo = display.newImageRect(groupFore,"images/figuras/losango_roxo.png", 69.5 , 75   )
		losango_roxo.x = display.contentCenterX - 240
		losango_roxo.y = display.contentCenterY - 30
		losango_roxo:addEventListener("touch", OnTouch)

		triangulo_vermelho = display.newImageRect(groupFore,"images/figuras/triangulo_vermelho.png", 98.2, 104.6  )
		triangulo_vermelho.x = display.contentCenterX  - 140
		triangulo_vermelho.y = display.contentCenterY  + 80
		triangulo_vermelho:addEventListener("touch", OnTouch)

		triangulo_azul = display.newImageRect(groupFore,"images/figuras/triangulo_azul.png", 49.1, 104.6  )
		triangulo_azul.x = display.contentCenterX - 240
		triangulo_azul.y = display.contentCenterY + 80
		triangulo_azul:addEventListener("touch", OnTouch)

----------------------------------------------------------------------------------------------------------------------
		-- Criando peças do gato e adicionando ao Grupo do Gato
		retangulo_verde_encaixe = display.newImageRect(groupCat,"images/figuras/retangulo_verde.png", 98.2, 53  )
		retangulo_verde_encaixe.x = display.contentCenterX + 232
    retangulo_verde_encaixe.y = display.contentCenterY + 114
    retangulo_verde_encaixe.alpha = 0.3
    retangulo_verde_encaixe:setFillColor(0,0,0)
		
		triangulo_amarelo_encaixe = display.newImageRect(groupCat,"images/figuras/triangulo_amarelo.png", 69.5, 147.5  )
		triangulo_amarelo_encaixe.x = display.contentCenterX + 147
    triangulo_amarelo_encaixe.y = display.contentCenterY + 27
    triangulo_amarelo_encaixe.alpha = 0.3
    triangulo_amarelo_encaixe:setFillColor(0,0,0)
	
		triangulo_rosa_encaixe = display.newImageRect(groupCat,"images/figuras/triangulo_rosa.png", 34.7, 75  )
		triangulo_rosa_encaixe.x = display.contentCenterX + 72
    triangulo_rosa_encaixe.y = display.contentCenterY - 115
    triangulo_rosa_encaixe.alpha = 0.3
    triangulo_rosa_encaixe:setFillColor(0,0,0)

		triangulo_laranja_encaixe = display.newImageRect(groupCat,"images/figuras/triangulo_laranja.png", 33.7, 74  )
		triangulo_laranja_encaixe.x = display.contentCenterX + 107
    triangulo_laranja_encaixe.y = display.contentCenterY - 115
    triangulo_laranja_encaixe.alpha = 0.3
    triangulo_laranja_encaixe:setFillColor(0,0,0)

		losango_roxo_encaixe = display.newImageRect(groupCat,"images/figuras/losango_roxo.png", 69.5 , 75   )
		losango_roxo_encaixe.x = display.contentCenterX + 90
    losango_roxo_encaixe.y = display.contentCenterY - 72
    losango_roxo_encaixe.alpha = 0.3
    losango_roxo_encaixe:setFillColor(0,0,0)

		triangulo_vermelho_encaixe = display.newImageRect(groupCat,"images/figuras/triangulo_vermelho.png", 98.2, 104.6  )
		triangulo_vermelho_encaixe.x = display.contentCenterX  + 132
    triangulo_vermelho_encaixe.y = display.contentCenterY  + 87
    triangulo_vermelho_encaixe.alpha = 0.3
    triangulo_vermelho_encaixe:setFillColor(0,0,0)

		triangulo_azul_encaixe = display.newImageRect(groupCat,"images/figuras/triangulo_azul.png", 49.1, 104.6  )
		triangulo_azul_encaixe.x = display.contentCenterX + 84
    triangulo_azul_encaixe.y = display.contentCenterY + 5
    triangulo_azul_encaixe.alpha = 0.3
    triangulo_azul_encaixe:setFillColor(0,0,0)
------------------------------------------------------------------------------------------------------------------------
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
		
		print("gatoNivel3 Show Function")

		if ( phase == "will" ) then
			print("gatoNivel3 Show Phase Will")
		elseif ( phase == "did" ) then
			print("gatoNivel3 Show Phase Did")
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
	
		print("gatoNivel3 Hide Function")

		if ( phase == "will" ) then
			print("gatoNivel3 Hide Phase Will")
		elseif ( phase == "did" ) then
			print("gatoNivel3 Hide Phase Did")
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
	print("gatoNivel3 Destroy Function")

	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
return scene