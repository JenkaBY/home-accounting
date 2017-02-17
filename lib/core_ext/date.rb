class Date

  def new_from_hash
    Date.new *%w(1 2 3).map { |e| hash["start_date(#{e}i)"].to_i }
  end

end