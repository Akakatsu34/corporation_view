class CorporationsController < ApplicationController
  def index
    @corporations = Corporation.all
    @bs = Bs.all
    @pls = Pl.all
    @cfs = Cf.all
  end

  def show

  end
end
