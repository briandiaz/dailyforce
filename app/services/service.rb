class Service
    
    def initialize(rest_client)
        @rest_client = rest_client
    end
    
    def attrs(params)
        []
    end

    def self.find_all(rest_client, sql_query = nil)
        query(rest_client, sql_query)
    end
    
    def self.find(rest_client, id)
        rest_client.find(sf_object_name, id)
    end
    
    def self.light_data(rest_client)
        query(rest_client, "select Id, Name from #{sf_object_name}")
    end
    
    def self.query(rest_client, sql_query)
        rest_client.query(sql_query)
    end

    def create!(*object_hash)
        @rest_client.create!(*object_hash)
    end
    
    def create(params)
        create!(*attrs(params))
    end

    def update!(*object_hash)
        @rest_client.update!(*object_hash)
    end
    
    def update(params)
        update!(*attrs(params))
    end

    def destroy(id)
        @rest_client.destroy!(sf_object_name, id)
    end
    
    def describe
        @rest_client.describe(sf_object_name)
    end
    
    def picklist(property)
        @rest_client.picklist_values(sf_object_name, property)
    end
    
    private
    
    def sf_object_name
        self.class.name.split('Service')[0]
    end
    
    def self.sf_object_name
        self.name.split('Service')[0]
    end
    
end