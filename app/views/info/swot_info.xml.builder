xml.swot_list(:name_of_swot=> @swot.name) do
   for m in @matrix_items
     xml.item do
       xml.value(m.value)
     end
   end
end