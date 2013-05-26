class MatchScreen < ProMotion::GroupedTableScreen
  title "Match"

  attr_accessor :href
  attr_accessor :match_title

  def on_load(args)
    PM.logger.info args
  end

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }
  end

  def on_appear
  end

  def table_data
    @hometable ||= [{
      title: "DIV II",
      cells: [
        {title: "Primal", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
        {title: "MB Easy", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
        {title: "MarblePositioning", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
      ]
    },
    {
    title: "DIV I",
      cells: [
        {title: "Primal", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
        {title: "MB Easy", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
        {title: "MarblePositioning", accessory_type: UITableViewCellAccessoryDisclosureIndicator},
      ]
    }
  ]
  end

end