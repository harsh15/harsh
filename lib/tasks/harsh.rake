namespace :harsh do

  # rake harsh:fetch_cities
  desc "fetch cities using mecanize gem"
  task :fetch_cities => [:environment] do
    count = 0
    country = Country.find_by(name: "India")
    doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_districts_in_India'))
    state_names_h2 = doc.xpath("//h2[span[@class='mw-headline']]")
    state_names_h2.each do |state_name_h2|
      name = state_name_h2.css("span.mw-headline")
      if name[0].to_s =~ /\d/
        state_name = name.text.gsub(/\s\(.*\)/, '')
        state = State.create!(name: state_name, country_id: country.id)
        if state_name == "Delhi"
          City.create!(name: "Delhi", state_id: state.id, country_id: country.id)
        else
          recruit_table = state_name_h2.at_xpath('following-sibling::table')
          label_trs = recruit_table.css('tr')[1..-1]
          label_trs.each do |label_tr|
            district_name = label_tr.css("td")[1]
            if district_name.present?
              name = district_name.content.gsub(/\[.*\]/, '')
              name = "Bangalore" if name == "Bangalore Urban"
              count += 1
              puts "#{count}, #{state_name} = #{name}"
              if name != "Bangalore Rural"
                City.create!(name: name, state_id: state.id, country_id: country.id)
              end  
            end
          end
        end

      end
    end

  end
end