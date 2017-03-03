# ps: Produção Sem Margem (horas em decimal)
# pc: Produção Com Margem (horas em decimal)
def productivity(ps, pc)
    wps = 1.0  # TODO config
    wpc = 11.0  # TODO config
    psfill = wpc > (wps+wpc)/2 ? ps + pc : ps
    pcfill = wps > (wps+wpc)/2 ? ps + pc : pc
    media = ( psfill * (wps) + pcfill * (wpc) ) / ( wps + wpc )
    percentage = ( media / ( wps + wpc ) ) * 100
    percentage
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
