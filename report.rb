require 'togglv8'
require 'json'

# gem install togglv8
# gem install awesome_print

$reports = TogglV8::ReportsV2.new(api_token: ENV['TOGGL_API_TOKEN'])

$reports.workspace_id = 1929617

tags = [
    '2997311',  # Ocupação Desnecessária
    '2997310',  # Ocupação Obrigatória
    '2997313',  # Produção Sem Margem
    '2997312'   # Produção Com Margem
]

def params(date, tag)
    {
        :'since' => date,
        :'until' => date,
        :'tag_ids' => tag
    }
end

def time_for(date, tag)
    data = $reports.summary('', params(date, tag))
    time = 0
    for project in data  # TODO
        #puts project['title']['project']
        #puts project['time']
        time += project['time']
    end
    time
end

today = Time.new.strftime('%Y-%m-%d')
today = Date.strptime('03/03/2017', '%d/%m/%Y').strftime('%Y-%m-%d')
times = tags.map{ |tag| time_for(today, tag) }
total = times.inject(0){ |sum,x| sum + x }

all = 24 * 60 * 60 * 1000
notracked = all - total
times.push notracked

$percentages_rounded = times.map{ |value| (value * 100.to_f / all).round }

$times = times

#puts times
#puts percentages_rounded

#time_for('2017-02-28', tag)

#puts JSON.pretty_generate(data)
