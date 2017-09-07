class StatsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def random
    @stat = Stat.order("RANDOM()").first
  end

  def index
    @stats = Stat.all.paginate(:page => params[:page], :per_page => 10)
  end
end
