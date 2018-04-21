class OrderstatusesController < ApplicationController
  def index
    @orderstatuses = Orderstatus.all
  end
end
