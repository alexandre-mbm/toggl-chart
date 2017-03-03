class WelcomeController < ApplicationController

  # http://code.google.com/apis/chart/interactive/docs/gallery/piechart.html#Example
  def index

    data_table = GoogleVisualr::DataTable.new

    data_table.new_column('string', 'Task')
    data_table.new_column('number', 'Hours per Day')
    data_table.add_rows(4)

    data_table.set_cell(0, 0, 'Ocupação Desnecessária'  )
    data_table.set_cell(0, 1, 15    )
    data_table.set_cell(1, 0, 'Ocupação Obrigatória'    )
    data_table.set_cell(1, 1, 25    )
    data_table.set_cell(2, 0, 'Produção Sem Margem'     )
    data_table.set_cell(2, 1, 20    )
    data_table.set_cell(3, 0, 'Produção Com Margem'     )
    data_table.set_cell(3, 1, 40    )

    opts   = { :width => 400, :height => 400, :title => 'Segunda-feira, 27', :is3D => true, :enableInteractivity => false }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, opts)

  end

end
