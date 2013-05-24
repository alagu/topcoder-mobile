class MatchArchiveScreen < ProMotion::GroupedTableScreen
  title "Match Archives"

  def on_load
    # Load data
  end

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }
  end

  def table_data
    @hometable ||= [{
      title: "Match Archive",
      cells: [
        {
        title: "SRM 579", action: :email_us,
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
        },
        {
        title: "TCO13 Parallel Round 2C", action: :email_us,
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
        },
        {
        title: "TCO13 Parallel Round 2C", action: :email_us,
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
        },
        {
        title: "TCO13 Parallel Round 2C", action: :email_us,
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
        }
    ]
    }
  ]
  end

  def email_us
    mailto_link = NSURL.URLWithString("http://www.alagu.net/")
    UIApplication.sharedApplication.openURL(mailto_link)
  end

  def on_appear
    # Everything's loaded and visible
  end
end