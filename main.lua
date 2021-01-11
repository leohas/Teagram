---Background---
local background = display.newImageRect("background.jpg", 570 , 360)

background.x = display.contentCenterX
background.y = display.contentCenterY

---Peças soltas---

local losango_verde = display.newImageRect("images/figuras/losango_verde.png", 98.2, 53  )

losango_verde.x = display.contentCenterX - 130
losango_verde.y = display.contentCenterY - 105


local quadrado_laranja = display.newImageRect("images/figuras/quadrado_laranja.png", 69.5 , 75   )

quadrado_laranja.x = display.contentCenterX - 240
quadrado_laranja.y = display.contentCenterY - 30

local triangulo_amarelo = display.newImageRect("images/figuras/triangulo_amarelo.png", 69.5, 147.5  )

triangulo_amarelo.x = display.contentCenterX - 150
triangulo_amarelo.y = display.contentCenterY + 20 

local triangulo_rosa = display.newImageRect("images/figuras/triangulo_rosa.png", 34.7, 75  )

triangulo_rosa.x = display.contentCenterX - 240
triangulo_rosa.y = display.contentCenterY - 105

local triangulo_roxo = display.newImageRect("images/figuras/triangulo_roxo.png", 33.7, 74  )

triangulo_roxo.x = display.contentCenterX - 95
triangulo_roxo.y = display.contentCenterY - 20

local triangulo_verde = display.newImageRect("images/figuras/triangulo_verde.png", 49.1, 104.6  )

triangulo_verde.x = display.contentCenterX - 240
triangulo_verde.y = display.contentCenterY + 80

local triangulo_vermelho = display.newImageRect("images/figuras/triangulo_vermelho.png", 98.2, 104.6  )

triangulo_vermelho.x = display.contentCenterX  - 140
triangulo_vermelho.y = display.contentCenterY  + 80

--- Peças em figura---

local triangulo_roxo_encaixe = display.newImageRect("images/figuras/triangulo_roxo.png", 33.7, 74  )

triangulo_roxo_encaixe.x = display.contentCenterX + 107
triangulo_roxo_encaixe.y = display.contentCenterY - 115
triangulo_roxo_encaixe.alpha = 0.3

local triangulo_rosa_encaixe = display.newImageRect("images/figuras/triangulo_rosa.png", 34.7, 75  )

triangulo_rosa_encaixe.x = display.contentCenterX + 72
triangulo_rosa_encaixe.y = display.contentCenterY - 115
triangulo_rosa_encaixe.alpha = 0.3

local quadrado_laranja_encaixe = display.newImageRect("images/figuras/quadrado_laranja.png", 69.5 , 75   )

quadrado_laranja_encaixe.x = display.contentCenterX + 90
quadrado_laranja_encaixe.y = display.contentCenterY - 72
quadrado_laranja_encaixe.alpha = 0.3

local triangulo_verde_encaixe = display.newImageRect("images/figuras/triangulo_verde.png", 49.1, 104.6  )

triangulo_verde_encaixe.x = display.contentCenterX + 84
triangulo_verde_encaixe.y = display.contentCenterY + 5
triangulo_verde_encaixe.alpha = 0.3

local triangulo_amarelo_encaixe = display.newImageRect("images/figuras/triangulo_amarelo.png", 69.5, 147.5  )

triangulo_amarelo_encaixe.x = display.contentCenterX + 147
triangulo_amarelo_encaixe.y = display.contentCenterY + 27 
triangulo_amarelo_encaixe.alpha = 0.3

local triangulo_vermelho_encaixe = display.newImageRect("images/figuras/triangulo_vermelho.png", 98.2, 104.6  )

triangulo_vermelho_encaixe.x = display.contentCenterX  + 132
triangulo_vermelho_encaixe.y = display.contentCenterY  + 87
triangulo_vermelho_encaixe.alpha = 0.3

local losango_verde_encaixe = display.newImageRect("images/figuras/losango_verde.png", 98.2, 53  )

losango_verde_encaixe.x = display.contentCenterX + 232
losango_verde_encaixe.y = display.contentCenterY + 114
losango_verde_encaixe.alpha = 0.3

