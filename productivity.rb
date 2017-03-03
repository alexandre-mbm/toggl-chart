# ps: Produção Sem Margem (horas em decimal)
# pc: Produção Com Margem (horas em decimal)
def calcule(ps, pc)
    wps = 1.0  # TODO config
    wpc = 11.0  # TODO config
    psfill = wpc > (wps+wpc)/2 ? ps + pc : ps
    pcfill = wps > (wps+wpc)/2 ? ps + pc : pc
    media = ( psfill * (wps) + pcfill * (wpc) ) / ( wps + wpc )
    percentage = ( media / ( wps + wpc ) ) * 100
    puts "%d × ( %d ) + %d × ( %d ) = %0.1f%" % [ ps, wps, pc, wpc, percentage ]
end

# wps e wpc são os pesos para ps e pc
# wps+wpc deve ser igual ao universo ps+pc ideal

# Não existe produção fora de Produção Sem Margem e Produção Com Margem.
# Ou seja, ocupações não constituem produção. Por isso apenas ps e pc.

# Exemplo de dia ideal:
#
# 1 hora de lazer *
# 7 horas de sono *
# 3 horas de operações tais como higiene e alimentação **
# 1 hora de obrigações circuntanciais (suposto)
#
# 1 hora de produção sem margem = ps
# 11 horas de produção com margem = pc
#
# Fora da produção, o ideal é tudo seja obrigação. Mas surgem as ocupações
# desnecessárias, tanto lá como cá, em detrimento de obrigações e produções.

for n in 0..12
    m = 12 - n
    calcule n, m
end

puts

calcule 0, 0
calcule 1, 0
calcule 1, 12
calcule 12, 12
calcule 0, 13
calcule 0, 14

puts

calcule 6, 6
calcule 0, 6
calcule 0, 7
calcule 6, 0
