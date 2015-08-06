class PairsController < ApplicationController

  def index
  end

  def show
  end

  def all
    @pairs = Pairing.all
  end
end
