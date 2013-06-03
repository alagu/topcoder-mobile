class MatchScreen < BaseTableScreen
  title "Match"

  attr_accessor :href
  attr_accessor :match_title

  def fetch_problems
    match_url = "http://community.topcoder.com/" + href

    BW::HTTP.get(match_url) do |response| 
      html = response.body.to_str

      div_one_problems = []
      div_two_problems = []
      problems         = []

      lines = html.split "\n"
      lines.each do |line|
        if line.include? "/stat?c=problem_statement&pm="
          match_data = /HREF=\"(.+)\" class=\"statText\">(.+)<\/A/.match line
          problems << {
            title: match_data[2],
            action: :open_problem,
            arguments: { href: match_data[1], title: match_data[2]},
            accessory_type: UITableViewCellAccessoryDisclosureIndicator
          }
        end
      end

      div_one_problems, div_two_problems = problems.each_slice(3).to_a

      if div_two_problems.nil? or div_two_problems.length == 0
        @hometable = [{
            title: "Contest Problems",
            cells: div_one_problems
          }
        ]
      else
        @hometable = [{
            title: "DIV II Problems",
            cells: div_two_problems
          },
          {
            title: "DIV I Problems",
            cells: div_one_problems
          }
        ]
      end

      update_table_data
      hide_loading
    end
  end

  def on_load
    self.title = match_title
    show_loading
    fetch_problems
  end

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }
  end

  def open_problem(args)
    href  = args[:href]
    title = args[:title]
    
    open ProblemScreen.new(problem_title: title, href: href)
  end

  def table_data
    @hometable ||= []
  end
end