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
    @corporation_name1 = Corporation.find_by(security_code: 6758).security_name
    @corporation_name2 = Corporation.find_by(security_code: 7974).security_name
    @corporation_name3 = Corporation.find_by(security_code: 9697).security_name
    @corporation_name4 = Corporation.find_by(security_code: 9684).security_name
    @bs_asset1 = Bs.find_by(security_code: 6758).asset
    @bs_asset2 = Bs.find_by(security_code: 7974).asset
    @bs_asset3 = Bs.find_by(security_code: 9697).asset
    @bs_asset4 = Bs.find_by(security_code: 9684).asset
    @corporation_name = Corporation.find_by(security_code: 9684).security_name
    @corporation_data = { "security_name": "AAA", "value": 50000000000 }
    @results = @q.result
  end

  def search
    @results = @q.result
  end

  private

   def set_q
    @q = Corporation.ransack(params[:q])
  end

end
