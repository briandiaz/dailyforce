class CaseService <  Service

    def attrs(params)
        [
          sf_object_name,
          ContactId: params[:contact],
          AccountId: params[:account],
          Type: params[:type],
          Status: params[:status],
          Reason: params[:reason],
          Priority: params[:priority],
          Origin: params[:origin],
          Product__c: params[:product],
          PotentialLiability__c: params[:potentialliability],
          EngineeringReqNumber__c: params[:engineeringreqnumber],
          SLAViolation__c: params[:slaviolation],
          Subject: params[:subject],
          Description: params[:description],
          Id: (params[:id]) ? params[:id] : nil
        ]
    end

    def self.find_all(rest_client, sql_query = nil)
        super(rest_client, "select Id, Subject, CreatedDate, CaseNumber, Priority, Reason from #{sf_object_name}")
    end

end