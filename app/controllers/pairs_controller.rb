class PairsController < ApplicationController

  def index
  end

  def show
  end

  def all
    @pairs = Pairing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pairs }
    end
  end
end
