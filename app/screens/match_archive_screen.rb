class MatchArchiveScreen < BaseTableScreen
  title "Match Archives"

  def fetch_matches
    html = ''
    @matches = []


    BW::HTTP.get("http://community.topcoder.com/tc?module=MatchList") do |response| 
      html = response.body.to_str

      lines = html.split "\n"
      lines.each do |line|
        if line.include? '"value"'
          match_data = /href=\"(.+)\">(.+)<\/a/.match line
            @matches << {
            title: match_data[2],
            action: :open_match,
            arguments: { href: match_data[1], title: match_data[2]},
            accessory_type: UITableViewCellAccessoryDisclosureIndicator
          }
        end
      end

      @hometable = [{
          title: "Match Archive",
          cells: @matches
        }
      ]

      update_table_data
      hide_loading
    end

  end

  def on_load
    show_loading
    fetch_matches
  end

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }
  end

  def table_data
    @hometable ||= [{
      title: "Match Archive",
      cells: @matches
    }
  ]

    @hometable
  end

  def open_match(args)
    href  = args[:href]
    title = args[:title]
    
    open MatchScreen.new(match_title: title, href: href)
  end

  def on_appear
    # Everything's loaded and visible
  end
end