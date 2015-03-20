class MenuTabBuilder < TabsOnRails::Tabs::TabsBuilder
  def tab_for(tab, name, options, item_options = {})
    item_options[:class] = (current_tab?(tab) ? "active" : "")
    @context.content_tag(:li, item_options) do
      @context.link_to(name, options)
    end
  end
end
