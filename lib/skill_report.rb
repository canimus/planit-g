require 'prawn'
require 'mongo'

Prawn::Document.generate("cv.pdf", page_layout: :landscape) do |pdf|
	pdf.font_families.update("Nexa" => {
        :bold => "/sw/apps/perforchestor/public/fonts/nexa_bold.ttf",
        :normal => "/sw/apps/perforchestor/public/fonts/nexa_light.ttf"
      })

	pdf.font("Nexa", size:40, style: :bold) do
        start_pos = 0
        pdf.fill_color "AAAAAA"
        pdf.text_box "Oleg Kobets", :at => [0,520], :width => 600, :height => 60, :overflow => :shrink_to_fit, :align => :left
  	end
end

