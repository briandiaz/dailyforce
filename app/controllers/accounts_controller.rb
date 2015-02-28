class AccountsController < ApplicationController
  include ControllerHelper
  
  skip_before_action :verify_authenticity_token
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_account_service, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_account_relations, only: [:new, :create, :edit, :update]
  
  def index
    @accounts = AccountService.find_all(current_client)
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    create_action(@account_service, params, accounts_path, "Account was successfully created!")
  end
  
  def update
    update_action(@account_service, params, accounts_path, "Account was successfully updated!")
  end

  def destroy
    destroy_action(@account_service, params[:id], accounts_path)
  end
  
  private
    
    def set_account_service
      @account_service = AccountService.new(current_client)
    end  
    
    def set_account
      @account = AccountService.find(current_client, params[:id])
      @parent_account = AccountService.find(current_client, @account.ParentId)
    end
    
    def set_account_relations
      @accounts = AccountService.find_all(current_client)
    end
    
end
