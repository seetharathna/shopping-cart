# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

 def all_guides
   Guide.find(:all).map{|g|[g.name,g.id]}
 end


end
