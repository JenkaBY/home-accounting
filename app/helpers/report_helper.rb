module ReportHelper

  def date_from_hash hash
    Date.new *%w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end

  def processing_array array
    delete_empty_string_from_array array
    array.map! { |el| el.to_i }
  end

  def delete_empty_string_from_array array
    array.delete ''
  end
end
