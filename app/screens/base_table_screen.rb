class BaseTableScreen < ProMotion::GroupedTableScreen

  def show_loading
    @indicator = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhiteLarge)
    @indicator.center = view.center
    view.addSubview @indicator

    @indicator.hidesWhenStopped = true
    @indicator.startAnimating
  end

  def hide_loading
    @indicator.stopAnimating
  end

end