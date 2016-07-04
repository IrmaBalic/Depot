module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def cp(path)
  "current" if request.url.include?(path)
  end

  def cl(loc)
  	"current" if I18n.locale == loc.to_sym
  end
end
