Scripts Ruby que validam como gerar gráficos mensurando minha produtividade.

Este branch está liberado sob [Licença MIT](LICENSE).

# test-gchart

Protótipo completo com geração de gráfico de pizza (PNG), índice de produtividade e acesso à Toggl API.

```console
$ # Dependências
$ gem install togglv8
$ gem install googlecharts
$ gem install awesome_print
$ # Configuração do ambiente
$ export TOGGL_API_TOKEN=[SECRET]
$ export RUBYOPT="-W0"
$ # Execução
$ ruby test-gchart.rb; eog chart.png
```

# test-squid

este com biblioteca bem mais simples, onde somente é gerado gráfico de barras verticais (PDF), dos percentuais (y) de 4 tipos de tarefas pelos 7 dias da semana (x).

```console
$ # Dependências
$ gem install squid
$ # Execução
$ ruby test-squid.rb ; evince chart.pdf
```
