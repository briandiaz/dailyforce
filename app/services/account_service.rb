class AccountService <  Service

    def attrs(params)
        [
            sf_object_name,
            Name: params[:name],
            Type: params[:type],
            ParentId: params[:parent],
            AccountNumber: params[:number],
            Site: params[:site],
            Industry: params[:industry],
            AnnualRevenue: params[:annualrevenue].to_f,
            Rating: params[:rating],
            Phone: params[:phone],
            Fax: params[:fax],
            Website: params[:website],
            TickerSymbol: params[:ticker],
            Ownership: params[:ownership],
            NumberOfEmployees: params[:employees].to_i,
            Sic: params[:siccode],
            BillingStreet: params[:billingstreet],
            BillingCity: params[:billingcity],
            BillingState: params[:billingstate],
            BillingPostalCode: params[:billingpostalcode],
            BillingCountry: params[:billingcountry],
            ShippingStreet: params[:shippingstreet],
            ShippingCity: params[:shippingcity],
            ShippingState: params[:shippingstate],
            ShippingPostalCode: params[:shippingpostalcode],
            ShippingCountry: params[:shippingcountry],
            CustomerPriority__c: params[:customerpriority],
            SLAExpirationDate__c: (params[:slaexpirationdate] != "") ? params[:slaexpirationdate] : nil,
            NumberofLocations__c: params[:numberoflocations].to_i,
            Active__c: params[:active],
            SLA__c: params[:sla],
            SLASerialNumber__c: params[:slaserialnumber],
            UpsellOpportunity__c: params[:upsellopportnity],
            Description: params[:description],
            Id: (params[:id]) ? params[:id] : nil
        ]
    end

    def self.find_all(rest_client, sql_query = nil)
        super(rest_client, "select Id, Name, BillingCity, Type, Rating, Phone from #{sf_object_name}")
    end

end