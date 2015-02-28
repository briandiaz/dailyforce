class ContactService <  Service

    def attrs(params)
        [
          sf_object_name,
          Id: (params[:id] || nil),
          Name: params[:name]
        ]
    end

    def self.find_all(rest_client, sql_query = nil)
        super(rest_client, "select Id, Name, HomePhone, MobilePhone, Email, Department, OwnerId  from #{sf_object_name}")
    end

end