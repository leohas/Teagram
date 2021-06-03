-- Inicializando o Composer
local composer = require("composer")

-- Escondendo a barra do celular que mostra a bateria, a hora, etc.
display.setStatusBar(display.HiddenStatusBar);

--[[ 
  Mudando de cena. Caso queira ir para uma cena diferente, apenas mude o nome
  do primeiro parâmetro para o nome do arquivo da cena.
--]]
composer.gotoScene("gatoNivel3", { time= 1000, effect= "crossFade"} );