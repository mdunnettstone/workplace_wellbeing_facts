class StatsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :checks_user_is_me, only: [:new]

  def random
    @stat = Stat.order("RANDOM()").first
  end

  def index
    @all_tags = Stat.tag_counts_on(:tags).order('count desc')
    if params[:tag]
      @stats = Stat.tagged_with(ActsAsTaggableOn::Tag.find(params[:tag]))
    else
      @stats = Stat.all
    end
  end

  def new
    @stat = Stat.new
  end

  def create
    @stat = Stat.create(stat_params)
    redirect_to stats_path
  end

  private

  def checks_user_is_me
    if current_user.email != "mdunnettstone@gmail.com"
      render plain: "If you would like to submit a fact, please email it to mike@seedmusic.co.uk", status: :unauthorized
    end
  end


  helper_method :current_tag
  def current_tag
    if (params[:tag])
      current_tag = ActsAsTaggableOn::Tag.find(params[:tag])
    end
  end

  def stat_params
    params.require(:stat).permit(:fact, :source, :year, :sample, :instruction, :tag_list)
  end
end
