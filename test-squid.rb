require 'squid'

# http://fullscreen.github.io/squid/

data = {
    'Ocupações Desnecessárias' => {
        'Dom' => 10,
        'Seg' => 30,
        'Ter' => 5,
        'Qua' => 1,
        'Qui' => 1,
        'Sex' => 1,
        'Sáb' => 1
    }, 
    'Ocupações Obrigatórias' => {
        'Dom' => 15,
        'Seg' => 30,
        'Ter' => 5,
        'Qua' => 1,
        'Qui' => 1,
        'Sex' => 1,
        'Sáb' => 1
    },
    'Produção Sem Margem' => {
        'Dom' => 25,
        'Seg' => 20,
        'Ter' => 70,
        'Qua' => 1,
        'Qui' => 1,
        'Sex' => 1,
        'Sáb' => 1
    },
    'Produção Com Margem' => {
        'Dom' => 50,
        'Seg' => 20,
        'Ter' => 20,
        'Qua' => 1,
        'Qui' => 1,
        'Sex' => 1,
        'Sáb' => 1
    }
}

Prawn::Document.generate 'chart.pdf' do
	  chart(data, format: :percentage)
end
