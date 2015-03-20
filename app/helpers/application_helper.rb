module ApplicationHelper
  def render_flash
    flash_class = { notice: "alert-success", alert: "alert-danger" }

    flash.map do |name, msg|
      content_tag :div, class: "alert alert-dismissable text-center #{flash_class[name.to_sym]}" do
        content = []
        content << link_to('&times;'.html_safe, '#', class: 'close', :"data-dismiss" => 'alert')
        content << msg
        content.join('').html_safe
      end
    end.join('').html_safe
  end

  def table_for(collection, *attr_list)
    actions = true

    table_id = collection.name.tableize
    table_klazz = collection.name.constantize
    table_headers = []

    attr_list.each do |attr_name|
      if attr_name.class == Hash && !attr_name[:actions].nil?
        actions = attr_name[:actions]
      else
        table_headers << content_tag(:th, table_klazz.human_attribute_name(attr_name))
      end
    end

    if actions
      table_headers << content_tag(:th, t('actions'), class: 'table_actions')
    end

    thead = content_tag :thead, content_tag(:tr, table_headers.join(" ").html_safe)
    tbody = content_tag :tbody, render(collection)

    table = content_tag(:table, "#{thead} #{tbody}".html_safe, id: table_id, class: "table table-bordered table-striped")
    table.html_safe
  end

  def info_box(text=nil, icon=true)
    text = t("#{controller_name}.#{action_name}.info") if text.nil?
    icon_klazz = "info-circle" if icon.present?

    alert_block(text, "info", icon_klazz)
  end

  def alert_block(text, klazz="info", icon_klazz=nil)
    icon_html = icon(icon_klazz) if icon_klazz.present?
    text = "#{icon_html} #{text}" if icon_klazz.present?

    content_tag :div, text.html_safe, class: "alert alert-block alert-#{klazz}"
  end

  def image_url_for attachment, style
    if attachment.present?
      attachment.send("#{style.to_s}_url".to_sym)
    else
      "missing_#{style}.png"
    end
  end

  def published_for field, icon="clock-o"
    content_tag :span do
      content = []
      content << icon("#{icon}")
      content << t("ago", time_ago: time_ago_in_words(field))
      content.join(' ').html_safe
    end
  end

  def expire_for advert
    content_tag :span do
      content = []
      content << content_tag(:strong, t("expire"))
      content << t("in", time: distance_of_time_in_words_to_now(advert.renewed_at + EXPIRE_TIME))
      content.join(' ').html_safe
    end
  end

  def times_visited_for advert
    content_tag :span do
      content = []
      content << icon("eye")
      content << "Visto #{advert.viewed_count} veces"
      content.join(' ').html_safe
    end
  end

  def phone_for field
    if field.present?
      content = []
      content << content_tag(:span, field[0,5])
      content << content_tag(:span, field[5,field.length])
      content.join('').html_safe
    end
  end

  def legal_text
    t("accept", terms: link_to(t("terms"), page_path("terms"), target: "_blank"), privacy: link_to(t("privacy"), page_path("privacy"), target: "_blank")).html_safe
  end

  def icon(klazz)
    content_tag :span, nil, class: "fa fa-#{klazz}"
  end

  def button_link_to(text, target, klazz=nil, icon_klazz=nil)
    if icon_klazz.present?
      icon_html = icon(icon_klazz)
      string = "#{icon_html} #{text}".html_safe
    else
      string = text
    end

    link_to string, target, class: "btn #{klazz}"
  end

  def link_with_icon(text, target, klazz=nil, icon_klazz=nil)
    if icon_klazz.present?
      icon_html = icon(icon_klazz)
      string = "#{icon_html} #{text}".html_safe
    else
      string = text
    end

    link_to string, target, class: "#{klazz}"
  end

  def remove_button(text, target, klazz=nil)
    remove_link(text, target, "btn btn-danger #{klazz}")
  end

  def remove_link(text, target, klazz=nil, icon_klazz="trash-o")
    link_to "#{icon(icon_klazz)} #{text}".html_safe, target,
      class: "#{klazz}", method: :delete, data: { confirm: t("are_you_sure") }
  end

  def cancel_button(target)
    link_to t("cancel"), target, class: "btn"
  end

  def price_for advert
    if advert.price.blank? || advert.price == 0
      "Consultar"
    else
      number_to_currency(advert.price, precision: 0)
    end
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
    @markdown.render(content)
  end

  def contacts_for advert
    klazz = advert.contacts.pending_read.any? ? "btn-primary" : "btn-default"
    button_link_to advert.contacts.count, user_advert_advert_contacts_path(advert), "btn-sm #{klazz}", "envelope"
  end

  def random_string
    Array.new(6){[*'0'..'9', *'a'..'z'].sample}.join
  end

  def article_image article
    image_tag "http://cloud.sudamos.es/blog/#{article.id}/#{article.slug}.jpg", class: "full-width"
  end

end
