class SearchController < ApplicationController
  def results
    @results = []
    @results << Group.find(:all, :conditions =>[ "LOWER (description) LIKE ? OR LOWER (name) LIKE ?","%#{params[:search]}%","%#{params[:search]}%"]).map{|g| {:name => g.name, :type => "Group", :id=> g.id}}




    @results << User.find(:all, :conditions =>["LOWER (user_name) LIKE ? OR LOWER (bio) LIKE ?","%#{params[:search]}%","%#{params[:search]}%"]).map{|g| {:name => g.user_name, :type => "User", :id=> g.id}}

    @results = @results.flatten.uniq.sort_by{|a| a[:id]}.reverse
  end
end
