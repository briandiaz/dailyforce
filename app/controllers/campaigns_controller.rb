class CampaignsController < ApplicationController
  include ControllerHelper
  skip_before_action :verify_authenticity_token
  
  before_action :set_campaign_service, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = CampaignService.find_all(current_client)
  end

  def show
    
  end

  def new
    
  end

  def edit
    
  end
  
  def create
    create_action(@campaign_service, params, campaigns_path, "Campaign was successfully created!")
  end
  
  def update
    update_action(@campaign_service, params, campaign_path(params[:id]), "Campaign was successfully updated!")
  end

  def destroy
    destroy_action(@campaign_service, params[:id], campaigns_path)
  end
  
  private
    def set_campaign_service
      @campaign_service = CampaignService.new(current_client)
      @campaigns =  CampaignService.light_data(current_client)
    end
    
    def set_campaign
      @campaign =  CampaignService.find(current_client, params[:id])
      @parentcampaign =  CampaignService.find(current_client, @campaign.ParentId)
    end
  
end
