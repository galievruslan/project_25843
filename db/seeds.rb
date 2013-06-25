# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
country1 = Country.create(name: "Russia", fips104: "RS",iso2: "RU", iso3: "RUS",ison: "643", internet: "RU", capital: "Moscow ", map_reference: "Asia ", nationality_singular: "Russian", nationaiity_plural: "Russians", currency: "Russian Ruble", currency_code: "RUB", population: 145470197, title: "Russia")
country2 = Country.create(name: "United States", fips104: "US",iso2: "US", iso3: "USA",ison: "840", internet: "US", capital: "Washington, DC ", map_reference: "North America ", nationality_singular: "American", nationaiity_plural: "Americans", currency: "US Dollar", currency_code: "USD", population: 278058881, title: "The United States")
region1 = Region.create(name: "Tatarstan", code: "TT", adm1code: "RS73", country: country1)
region2 = Region.create(name: "Mariy-El", code: "ME", adm1code: "RS45", country: country1)
region3 = Region.create(name: "Texas", code: "TX", adm1code: "    ", country: country2)
region4 = Region.create(name: "Pennsylvania", code: "PA", adm1code: "    ", country: country2)
city1 = City.create(name: "Kazan", latitude: "55.75", longitude: "49.133", timezone: "+04:00", dma_id: "0", code: "KAZA", country: country1, region: region1)
city1 = City.create(name: "Yoshkar-Ola", latitude: "56.637", longitude: "47.871", timezone: "+04:00", dma_id: "0", code: "YOSH", country: country1 , region: region2)
city1 = City.create(name: "Texas City", latitude: "29.3942", longitude: "-94.9343", timezone: "-06:00", dma_id: "618", code: "TCIT", country: country2 , region: region3)
city1 = City.create(name: "Harrisburg", latitude: "35.3285", longitude: "-80.661", timezone: "-05:00", dma_id: "517", code: "HARR", country: country2 , region: region4)