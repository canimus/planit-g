require 'prawn'
require 'mongo'

Prawn::Document.generate("cv.pdf", page_layout: :landscape) do |pdf|
	pdf.font_families.update("Nexa" => {
        :bold => "/sw/apps/perforchestor/public/fonts/nexa_bold.ttf",
        :normal => "/sw/apps/perforchestor/public/fonts/nexa_light.ttf"
      })

	# Name
	pdf.font("Nexa", size:40, style: :bold) do
        start_pos = 0
        pdf.fill_color "333333"
        pdf.text_box "Oleg Kobets", :at => [0,500], :width => 600, :height => 60, :overflow => :shrink_to_fit, :align => :left
  	end

  	# Title
  	pdf.font("Nexa", size:12, style: :normal) do
        start_pos = 0
        pdf.fill_color "000000"
        pdf.text_box "Technical Test Consultant / TTC", :at => [0,520], :width => 600, :height => 60, :overflow => :shrink_to_fit, :align => :left
  	end

  	# Certifications
  	pdf.font("Nexa", size:12, style: :bold) do
        start_pos = 0
        pdf.fill_color "000000"
        pdf.text_box "CERTIFICATIONS", :at => [2,420], :width => 600, :height => 60, :overflow => :shrink_to_fit, :align => :left
  	end

  	pdf.line([0,405], [200,405])
  	pdf.stroke

  	# Certification List
  	c = ["ToastMasters", "ISTQB Foundation", "ISTQB Adv. Technical Test Analyst", 
  		"ISTQB Adv. Test Manager", "ISTQB Expert Test Management", "ISTQB Expert Process Improvement", 
  		"ISTQB Expert Automation", "ISQi Agile Essentials", "ISQi Agile Tester", "PRINCE2 Foundation", "PRINCE2 Practitioner", 
  		"ITIL Practitioner", "Project Management Professional - PMP", "Open Group Arch. Framework - TOGAF"]
  	pdf.font("Nexa", size:10, style: :normal) do
        start_pos = 0
        pdf.fill_color "000000"
        c.each_with_index do |name, i|
        	pdf.text_box "#{name}", :at => [2,(400-(18*i))], :width => 600, :height => 60, :overflow => :shrink_to_fit, :align => :left
        end
  	end

end

