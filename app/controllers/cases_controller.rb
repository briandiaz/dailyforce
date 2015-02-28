class CasesController < ApplicationController
  include ControllerHelper
  skip_before_action :verify_authenticity_token
  
  before_action :set_case_service, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_case, only: [:show, :edit, :update]
  before_action :set_case_relations, only: [:show, :new, :edit, :update]

  def index
    @cases = CaseService.find_all(current_client)
  end

  def show
    
  end

  def new
    
  end

  def edit
    
  end
  
  def create
    create_action(@case_service, params, cases_path, "Account was successfully created!")
  end
  
  def update
    update_action(@case_service, params, case_path(params[:id]), "Account was successfully updated!")
  end

  def destroy
    destroy_action(@case_service, params[:id], cases_path)
  end
  
  private
    def set_case_service
      @case_service = CaseService.new(current_client)
    end
    
    def set_case
      @case = CaseService.find(current_client, params[:id])
      @account = AccountService.find(current_client, @case.AccountId)
      @contact = ContactService.find(current_client, @case.ContactId)
      @modified_by =UserService.find(current_client,  @case.LastModifiedBy).recentItems.first
      @created_by = UserService.find(current_client, @case.CreatedById)
    end
    
    def set_case_relations
      @accounts = AccountService.query(current_client, "select Id, Name, Type from Account")
      @contacts = ContactService.query(current_client, "select Id, Name, Title, Email, Department from Contact")
    end
    
end
