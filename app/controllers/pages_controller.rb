class PagesController < ApplicationController
    
    
    def home
        if current_user
          @accounts = current_client.query("select Id, Name, Description, AnnualRevenue from Account")
          @campaigns = current_client.query("select Id, Name from Campaign")
          @contacts = current_client.query("select Id, Name from Contact")
          @cases = current_client.query("select Id, Description, Reason, Origin from Case")
          @opportunities = current_client.query("select Id, Name, Amount, Probability from Opportunity")
          probabilities_opportunities = current_client.query("select SUM(Probability) from Opportunity")
          @percentage_opportunities = probabilities_opportunities.first.expr0/@opportunities.count
          @merchandises = current_client.query("select Id from Merchandise__c ")
        end
    end
    
    
    def login
        
    end
    
end
