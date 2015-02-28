class UserService <  Service

    def self.find_all(rest_client, sql_query = nil)
        super(rest_client, "select Id, Name, FirstName, LastName, Email, Phone, Mobile from #{sf_object_name}")
    end

end