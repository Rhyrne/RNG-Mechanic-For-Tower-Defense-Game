local TableModule = {}

TableModule.__index = TableModule

function TableModule.MoveAndDelete(Source,IndexOfItem,Destination)
	table.insert(Destination,Source[IndexOfItem])
	table.remove(Source,IndexOfItem)
end

return TableModule
