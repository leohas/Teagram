-- Inicializando o composer
local composer = require("composer")
 
-- Criando o objeto da cena
local scene = composer.newScene()

-- Adicionando biblioteca DragDrop
local widget = require( "widget" )
local DragMgr = require("dmc_dragdrop")
local Utils = require("dmc_utils")

local acertos = 0

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

-- Funções DragDrop
local dragStartHandler = function( e )
	local o = e.target
	print ("DRAG START")
	return true
end

local dragEnterHandler = function( e )
	local o = e.target
	print ("DRAG ENTER HANDLER")
	DragMgr:acceptDragDrop()
	return true
end

local dragOverHandler = function( e )
	return true
end

local dragExitHandler

local dragDropHandler = function( e )
	print ("DRAG DROP HANDLER")
	acertos = acertos + 1
	print(acertos)
		-- if acertos == numero_elementos then
		-- 	composer.showOverlay( "popup_win" ,{effect = "fade"  ,  params ={id=id, proximo_id = proximo_id, num_estrelas=3, level = composer.getSceneName( "current" ), proxima_cena = proxima_cena, category = category }, isModal = true} )
		-- end	
	return true
end

dragExitHandler = function( e )
	print ("DRAG EXIT")
	local o = e.target
	return true
end

local dragStopHandler = function( e )
	print ("DRAG STOP")
	local o = e.target
	return true
end

local function dragItemTouchHandler( event )
	local target = event.target

	if event.phase == "began" then
		-- now tell the Drag Manager about it
		DragMgr:doDrag( target, event, {data=target.source, format="Image"} )
	end

	return true
end

local touchFunction = function(event)
		if event.phase == "ended" then
			print (event.target.name)
			-- composer.showOverlay( "popup_pause" ,{effect = "fade"  ,  params ={nivel_teacch = nivel_teacch, fase = fase, cena = composer.getSceneName( "current" ), category = category}, isModal = true} )
		end
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
		backgroundImage = display.newImage(groupBack,"images/background1.png", display.contentWidth, display.contentHeight)
		backgroundImage.x = display.contentCenterX
		backgroundImage.y = display.contentCenterY
----------------------------------------------------------------------------------------------------------------------
			-- Criando peças do gato e adicionando ao Grupo do Gato
			retangulo_verde_encaixe = display.newImage("images/figuras/retangulo_verde1.png")
			groupCat:insert(retangulo_verde_encaixe)
			retangulo_verde_encaixe.name = 'retangulo_verde'
			retangulo_verde_encaixe.x = display.contentCenterX + 560
			retangulo_verde_encaixe.y = display.contentCenterY + 257.5
			retangulo_verde_encaixe.alpha = 0.3
			retangulo_verde_encaixe:setFillColor(0,0,0)
	
			triangulo_amarelo_encaixe = display.newImage("images/figuras/triangulo_amarelo1.png")
			groupCat:insert(triangulo_amarelo_encaixe)
			triangulo_amarelo_encaixe.name = 'triangulo_amarelo'
			triangulo_amarelo_encaixe.x = display.contentCenterX + 330
			triangulo_amarelo_encaixe.y = display.contentCenterY + 71
			triangulo_amarelo_encaixe.alpha = 0.3
			triangulo_amarelo_encaixe:setFillColor(0,0,0)
		
			triangulo_rosa_encaixe = display.newImage("images/figuras/triangulo_rosa1.png")
			groupCat:insert(triangulo_rosa_encaixe)
			triangulo_rosa_encaixe.name = 'triangulo_rosa'
			triangulo_rosa_encaixe.x = display.contentCenterX + 145
			triangulo_rosa_encaixe.y = display.contentCenterY - 260
			triangulo_rosa_encaixe.alpha = 0.3
			triangulo_rosa_encaixe:setFillColor(0,0,0)
	
			triangulo_laranja_encaixe = display.newImage("images/figuras/triangulo_laranja1.png")
			groupCat:insert(triangulo_laranja_encaixe)
			triangulo_laranja_encaixe.name = 'triangulo_laranja'
			triangulo_laranja_encaixe.x = display.contentCenterX + 250
			triangulo_laranja_encaixe.y = display.contentCenterY - 260
			triangulo_laranja_encaixe.alpha = 0.3
			triangulo_laranja_encaixe:setFillColor(0,0,0)
	
			losango_roxo_encaixe = display.newImage("images/figuras/losango_roxo1.png")
			groupCat:insert(losango_roxo_encaixe)
			losango_roxo_encaixe.name = 'losango_roxo'
			losango_roxo_encaixe.x = display.contentCenterX + 195
			losango_roxo_encaixe.y = display.contentCenterY - 155
			losango_roxo_encaixe.alpha = 0.3
			losango_roxo_encaixe:setFillColor(0,0,0)
	
			triangulo_vermelho_encaixe = display.newImage("images/figuras/triangulo_vermelho1.png")
			groupCat:insert(triangulo_vermelho_encaixe)
			triangulo_vermelho_encaixe.name = 'triangulo_vermelho'
			triangulo_vermelho_encaixe.x = display.contentCenterX  + 300
			triangulo_vermelho_encaixe.y = display.contentCenterY  + 209.5
			triangulo_vermelho_encaixe.alpha = 0.3
			triangulo_vermelho_encaixe:setFillColor(0,0,0)
	
			triangulo_azul_encaixe = display.newImage("images/figuras/triangulo_azul1.png")
			groupCat:insert(triangulo_azul_encaixe)
			triangulo_azul_encaixe.name = 'triangulo_azul'
			triangulo_azul_encaixe.x = display.contentCenterX + 180
			triangulo_azul_encaixe.y = display.contentCenterY + 35
			triangulo_azul_encaixe.alpha = 0.3
			triangulo_azul_encaixe:setFillColor(0,0,0)
----------------------------------------------------------------------------------------------------------------
		--Criando peças soltas e colocando no grupo do Foreground
		retangulo_verde = display.newImage("images/figuras/retangulo_verde1.png")
		retangulo_verde.source = "images/figuras/retangulo_verde1.png"
		groupFore:insert(retangulo_verde)
		retangulo_verde.name = 'retangulo_verde'
		retangulo_verde.x = display.contentCenterX - 530
		retangulo_verde.y = display.contentCenterY - 310
		retangulo_verde:addEventListener("touch", dragItemTouchHandler)

		triangulo_amarelo = display.newImage("images/figuras/triangulo_amarelo1.png")
		triangulo_amarelo.source = "images/figuras/triangulo_amarelo1.png"
		groupFore:insert(triangulo_amarelo)
		triangulo_amarelo.name = 'triangulo_amarelo'
		triangulo_amarelo.x = display.contentCenterX - 180
		triangulo_amarelo.y = display.contentCenterY - 220
		triangulo_amarelo:addEventListener("touch", dragItemTouchHandler)

		triangulo_rosa = display.newImage("images/figuras/triangulo_rosa1.png")
		triangulo_rosa.source = "images/figuras/triangulo_rosa1.png"
		groupFore:insert(triangulo_rosa)
		triangulo_rosa.name = 'triangulo_rosa'
		triangulo_rosa.x = display.contentCenterX - 535
		triangulo_rosa.y = display.contentCenterY - 45
		triangulo_rosa:addEventListener("touch", dragItemTouchHandler)

		triangulo_laranja = display.newImage("images/figuras/triangulo_laranja1.png")
		triangulo_laranja.source = "images/figuras/triangulo_laranja1.png"
		groupFore:insert(triangulo_laranja)
		triangulo_laranja.name = 'triangulo_laranja'
		triangulo_laranja.x = display.contentCenterX - 395
		triangulo_laranja.y = display.contentCenterY - 190
		triangulo_laranja:addEventListener("touch", dragItemTouchHandler)

		losango_roxo = display.newImage("images/figuras/losango_roxo1.png")
		losango_roxo.source = "images/figuras/losango_roxo1.png"
		groupFore:insert(losango_roxo)
		losango_roxo.name = 'losango_roxo'
		losango_roxo.x = display.contentCenterX - 320
		losango_roxo.y = display.contentCenterY + 90
		losango_roxo:addEventListener("touch", dragItemTouchHandler)

		triangulo_vermelho = display.newImage("images/figuras/triangulo_vermelho1.png")
		triangulo_vermelho.source = "images/figuras/triangulo_vermelho1.png"
		groupFore:insert(triangulo_vermelho)
		triangulo_vermelho.name = 'triangulo_vermelho'
		triangulo_vermelho.x = display.contentCenterX  - 230
		triangulo_vermelho.y = display.contentCenterY  + 250
		triangulo_vermelho:addEventListener("touch", dragItemTouchHandler)

		triangulo_azul = display.newImage("images/figuras/triangulo_azul1.png")
		triangulo_azul.source = "images/figuras/triangulo_azul1.png"
		groupFore:insert(triangulo_azul)
		triangulo_azul.name = 'triangulo_azul'
		triangulo_azul.x = display.contentCenterX - 550
		triangulo_azul.y = display.contentCenterY + 240
		triangulo_azul:addEventListener("touch", dragItemTouchHandler)
		
		DragMgr:register(triangulo_amarelo_encaixe, {
			grupo = groupCat,	
			dragStart=dragStartHandler,
			dragEnter=dragEnterHandler,
			dragOver=dragOverHandler,
			dragDrop=dragDropHandler,
			dragExit=dragExitHandler,
			dragStop=dragStopHandler})
		
			DragMgr:register(triangulo_azul_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})
		
			DragMgr:register(triangulo_laranja_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})
		
			DragMgr:register(triangulo_rosa_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})
		
			DragMgr:register(triangulo_vermelho_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})
		
			DragMgr:register(losango_roxo_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})

			DragMgr:register(retangulo_verde_encaixe, {
				grupo = groupCat,	
				dragStart=dragStartHandler,
				dragEnter=dragEnterHandler,
				dragOver=dragOverHandler,
				dragDrop=dragDropHandler,
				dragExit=dragExitHandler,
				dragStop=dragStopHandler})
end
------------------------------------------------------------------------------------------------------------------------
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