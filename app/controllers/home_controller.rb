class HomeController < ApplicationController

  def index

    # get paged workpieces page / number of elements

    @work_pieces = WorkPiece.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_pieces }
    end

  end

  def mainmenu
    @mainsections = Section.all

    # return json response
 
    respond_to do |format|
       format.js { render :file => 'app/views/home/sub_menu_art.html', :layout => false }
    end
  end

  def submenuart

    # should return json response

    respond_to do |format|
       format.js { render :file => 'app/views/home/sub_menu_art.html', :layout => false }
    end
  end

end
