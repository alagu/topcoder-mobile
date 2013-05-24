class HomeScreen < ProMotion::GroupedTableScreen
  title "Topcoder"

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
      title: "",
      cells: [
        {
        title: "Match Archive", action: :open_match_archive,
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
        },
        {
          title: "Login", action: :email_us
        }
      ]
    },
    {
      title: "Recent Problems",
      cells: [{
        title: "SRM 542", action: :email_us
        },
        {
          title: "SRM 541", action: :email_us  
      }]
    }
  ]
  end

  def open_match_archive
    open MatchArchiveScreen
  end

  def email_us
    mailto_link = NSURL.URLWithString("http://www.alagu.net/")
    UIApplication.sharedApplication.openURL(mailto_link)
  end

  def on_appear
    # Everything's loaded and visible
  end
end