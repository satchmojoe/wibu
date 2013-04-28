class SearchController < ApplicationController
  def results
    @results = []
    @results << Group.find(:all, :conditions =>[
          "LOWER (description) LIKE ? OR LOWER (name) LIKE ?","%#{params[:search]}%","%#{params[:search]}%"]).map{|g| {:name => g.name, :text_area => "Description", :text => g.description, :type => "Group", :id=> g.id}}
    @results << User.find(:all, :conditions =>[
          "LOWER (bio) LIKE ? OR LOWER (user_name) LIKE ?","%#{params[:search]}%","%#{params[:search]}%"]).map{|g| {:name => g.name, :text_area => "Description", :text => g.description, :type => "Group", :id=> g.id}}

    @results.flatten!.uniq!
  end
end
