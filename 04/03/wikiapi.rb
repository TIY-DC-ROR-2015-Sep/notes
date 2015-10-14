require 'mechanize'
require 'pry'

class Country
  def initialize name
    @name = name
  end

  def wikipedia_fact_sheet
    agent = Mechanize.new

    # Goto wikipedia
    page = agent.get "https://www.wikipedia.org/"

    # Type name in search box
    search_form = page.forms.first
    search_form.search = @name

    # Click to search
    page = agent.submit search_form

    # Pull data
    geo_table = page.search("table.geography")
    rows = geo_table.search "tr"

    results = {}
    rows.each do |r|
      cells = r.search "td"
      if cells.count == 2
        key   = cells.first.text
        value = cells.last.text

        results[key] = value
      end
    end

    binding.pry
    results
  end
end

puts Country.new("Qatar").wikipedia_fact_sheet
