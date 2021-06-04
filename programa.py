alturaReal = 2560
larguraReal = 1440

alturaPrograma = 570
larguraPrograma = 360

alturaPecaReal = input('Digite a altura da peça')
larguraPecaReal = input('Digite a largura da peça')

proporcaoAltura = (alturaReal/alturaPeca)
proporcaoLargura = (larguraReal/larguraPeca)

alturaPecaPrograma = alturaPrograma / proporcaoAltura
larguraPecaPrograma = larguraPrograma / proporcaoLargura

print('Sua peça terá as dimensões: {%.2f} x {%.2f}'.format(larguraPecaPrograma, alturaPecaPrograma))

