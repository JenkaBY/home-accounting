module ReportHelper

  def date_from_hash hash
    Date.new *%w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end

end
