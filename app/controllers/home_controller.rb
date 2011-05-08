class HomeController < ApplicationController

  def index
  end

  def submenuart
    respond_to do |format|
       format.js { render :file => 'app/views/home/sub_menu_art.html', :layout => false }
    end
  end

end
