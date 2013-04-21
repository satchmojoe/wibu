module UserHelper
  def collection_display collection
    collection.collect{|i| i.text}.to_s.gsub(/[^(a-z,0-9,_)]/,"").gsub(",",", ")
  end
end
