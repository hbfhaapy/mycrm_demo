
class DashboardController < ApplicationController

  def index
    authorize! :dashboard, :index
  end

  def crm
    authorize! :dashboard, :crm
  end

  def pm
    authorize! :dashboard, :pm
  end

  def fm
    authorize! :dashboard, :fm
  end

  def oa
    authorize! :dashboard, :oa
  end
end
