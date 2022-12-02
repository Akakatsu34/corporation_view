class CorporationsController < ApplicationController
  before_action :set_q, only: [:index, :show, :search]

  def index
    @corporations = Corporation.all
    @bs = Bs.all
    @pls = Pl.all
    @cfs = Cf.all
    @bs_asset_sum = Bs.all.sum(:asset)
    @bs_net_asset_sum = Bs.all.sum(:net_asset)
    @corporation_data = Corporation.where(security_code: 1301)
  end

  def show
    @corporation_results = @q.result
    @corporation_name = Corporation.find_by(security_code: 9684)
    @corporation_asset = Bs.find_by(asset: @corporation_name.security_code)
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Corporation.ransack(params[:q])
    @q.sorts = 'net_sale desc' if @q.sorts.empty?
  end

end
