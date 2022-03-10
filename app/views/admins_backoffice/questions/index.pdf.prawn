prawn_document do |pdf|
  pdf.text_box 'Listando Perguntas', size: 24, style: :bold, align: :center
  pdf.move_down 45

  header = %w[ID Descrição Assunto]
  questions = @questions.map { |d| [d.id, d.description, d.subject.description] }

  pdf.table(questions.unshift(header), position: :center, header: true, row_colors: %w[ffffff eaeaea]) do
    style(row(0), background_color: '333333',
                  align: :center,
                  text_color: 'FFFFFF',
                  border_width: 1,
                  padding: 12,
                  font_style: :bold)
  end
end
