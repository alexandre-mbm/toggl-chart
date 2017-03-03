require 'gchart'

load 'report.rb'
#puts $percentages_rounded
load 'human-time.rb'
load 'productivity.rb'

weekday = [
    'Domingo',
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado'
]

date = Date.strptime('03/03/2017', '%d/%m/%Y')
#date = Time.new  # TODO one time only
date = weekday[date.strftime('%w').to_i] + ', ' + date.strftime('%d')
#date = 'Segunda-feira, 27'

legend = [
    'Ocupação Desnecessária',   # Vermelho
    'Ocupação Obrigatória',     # Laranja
    'Produção Sem Margem',      # Azul
    'Produção Com Margem',      # Verde
    'Não rastreado'             # Cinza
]

percentage = [40, 10, 30, 15, 5]
percentage = $percentages_rounded

colors = [
    'EB5A46',
    'FFAB4A',
    '0079BF',
    '61BD4F',
    'B6BBBF'
]

percentage_as_string = percentage.map{ |number| number.to_s + '%' }
#percentage_as_string = ['40%', '10%', '30%', '15%', '5%']

human_times = $times.map{ |t| human_time(t) }
labels = Array.new(5)

percentage_as_string.each_with_index do |thing,index|
    labels[index] = thing + " (" + human_times[index] + ")"
    labels[index] += ' - ' + legend[index]
end  # TODO

puts labels
puts

my_ps = $times[2] / (1000*60*60)
my_pc = $times[3] / (1000*60*60)

puts "Productivity: %0.1f%" % (productivity my_ps, my_pc)

mychart = Gchart.new(
            :type => 'pie',
            :size => '400x200',
            :title => date,
            :legend => legend,
            :data => percentage,
            :filename => 'chart.png',
            :bar_colors => colors,
            :labels => percentage_as_string
        )

mychart.file
