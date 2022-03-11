prawn_document do |pdf|
  pdf.text_box 'Listando Assuntos', size: 24, style: :bold, align: :center
  pdf.move_down 45

  header = %w[ID Email]
  admins = @admins.map { |a| [a.id, a.email] }

  pdf.table(admins.unshift(header), position: :center, header: true, row_colors: %w[ffffff eaeaea], width: 500) do
    style(row(0), background_color: '333333',
                  align: :center,
                  text_color: 'FFFFFF',
                  border_width: 1,
                  padding: 12,
                  font_style: :bold)
    style(column(0), width: 60, align: :center)
  end
end
