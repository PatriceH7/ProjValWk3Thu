# Mairie_Trader.rb

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

# Initialize constants that will serve to iterate extractions

  TOWN_URL = []
  TOWN_LIST = []
  TOWN_EMAIL = []


#def get_townhall_email(townhall_url)

#  page = Nokogiri::HTML(RestClient.get(townhall_url))

#  page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]/@href').each do |email|
#    puts email.text
  #  TOWN_EMAIL << email.text
#  end
#  return 
#end


def get_townhall_urls(district_url)

	page = Nokogiri::HTML(RestClient.get(district_url))

  page.xpath('//a/@href').each do |node|

  node = node.to_s
  townhall_url = townhall_url.to_s
  #town_hall_email = town_hall_email.to_s

      if node[0..3] == "./95"
        townhall_url = "http://www.annuaire-des-mairies.com" + node[1..-1]
        puts townhall_url
        TOWN_URL << townhall_url

       # town_hall_email = get_townhall_email(townhall_url)
       # puts town_hall_email
       # TOWN_URL << townhall_url
       # TOWN_EMAIL << town_hall_email

         node = node[5..-1]
         node = node.chomp(".html")
         puts node
        TOWN_LIST << node

      else
      end 

    page.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[@class="lientxt"]/@href').each do |district|
      puts district
    end
  end

end

=begin
  
rescue Exception => e
  
end
def extraction_deputy_list
  page = Nokogiri::HTML(RestClient.get("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))   
  full_list_of_deputies = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
  full_list_of_deputies.each do |indiv_deputy|
    indiv_deputy = indiv_deputy.text
    RAW_LIST_OF_DEPUTIES << indiv_deputy
      if indiv_deputy[0..2] == "M. "
        indiv_deputy = indiv_deputy[3..-1]
      else
        indiv_deputy = indiv_deputy[4..-1]
      end
    indiv_deputy = indiv_deputy.split
    FIRST_NAMES << indiv_deputy[0]
    LAST_NAMES << indiv_deputy[1]
  end
end




#	page.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]').each do |district|
#	 puts "#{district}"

	end
end
=end

def get_townhall_email(townhall_url)

	page = Nokogiri::HTML(RestClient.get(townhall_url))

	page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]/@href').each do |email|
		puts email.text
	end
end

def perform
    district_url = "http://www.annuaire-des-mairies.com/val-d-oise.html"
    get_townhall_urls(district_url)
  #  TOWN_URL.each do |townhall_url|
   	townhall_url_bis = "http://www.annuaire-des-mairies.com/95/avernes.html"
	  get_townhall_email(townhall_url_bis)
   # end
end

perform
