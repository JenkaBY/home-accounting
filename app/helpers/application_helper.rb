module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display: none'
    end
    content_tag('div', attributes, &block)
  end

  def get_type_title(type_id)
    Type.find(type_id).title
  end

  def period(from_date, to_date)
    'from ' + from_date + ' to ' + to_date
  end

end