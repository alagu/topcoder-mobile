class ProblemScreen < ProMotion::Screen
  title "Problem"

  attr_accessor :href
  attr_accessor :problem_title

  def problem_url
    "http://community.topcoder.com/" + href
  end

  def on_load
    PM.logger.info "on_load"
    PM.logger.info problem_url
    BW::HTTP.get(problem_url) do |response| 
      html = response.body.to_str
      PM.logger.info html
      doc  = Nokogiri::HTML(html)
      doc.css('a').each do |link|
        PM.logger.info link.content
      end
    end
  end

  def will_appear
    PM.logger.info "will_appear"
    add_element draw_web_view
  end

  def draw_web_view
    @web_view ||= begin
      v = UIWebView.alloc.initWithFrame(self.view.bounds)
      v.delegate = self
      v.scrollView.scrollEnabled = false
      v.scrollView.bounces = false

      v.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString(@problem_url)))
      v
    end
  end

  def webView(inWeb, shouldStartLoadWithRequest: inRequest, navigationType: inType)
    PM.logger.info "webView"
    true
  end
end