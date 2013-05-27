module UserHelper
  def collection_display collection
    collection.collect{|i| i.text}.to_s.gsub(/[^(a-z,0-9,_)]/,"").gsub(",",", ")
  end

  def interest_list
    t = ""
    current_user.interests.all.each{|i|t = t+","+ i.text}
    return_list t
  end

  def expertise_list
    t = ""
    current_user.expertises.all.each{|i|t = t+","+ i.text}
    return_list t
  end
  
  def institution_list
    t = ""
    current_user.institutions.all.each{|i|t = t+","+ i.text}
    return_list t
  end

  def return_list list
    list = list.gsub(' ','_')
    list[1..-1] || ""
  end
end
