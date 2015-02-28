class CampaignService <  Service

    def attrs(params)
        [
          sf_object_name,
          Id: (params[:id]) ? params[:id] : nil,
          Name: params[:name],
          IsActive: (params[:active]=="on")? true : false,
          Type: params[:type],
          Status: params[:status],
          StartDate: params[:startdate],
          EndDate: params[:enddate],
          ExpectedRevenue: params[:expectedrevenue].to_f,
          BudgetedCost: params[:budgetedcost].to_f,
          ActualCost: params[:actualcost].to_f,
          ExpectedResponse: params[:expectedresponse].to_f,
          NumberSent: params[:numsent].to_i,
          ParentId: ((params[:parentcampaign] != "" or params[:parentcampaign] != nil)? params[:parentcampaign]: nil),
          Description: params[:description]
        ]
    end

    def self.find_all(rest_client, sql_query = nil)
        super(rest_client, "select Id, Name, IsActive, Type, Status, OwnerId, StartDate, EndDate, ExpectedRevenue, BudgetedCost, ActualCost, ExpectedResponse, NumberSent, ParentId, Description from #{sf_object_name}")
    end

end