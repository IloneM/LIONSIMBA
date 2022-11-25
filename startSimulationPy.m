% TODO : add a recursive filter for class function_handle
function formated_results = startSimulationPy(t0,tf,initialState,input_density,startParameters)
	results = startSimulation(t0,tf,initialState,input_density,startParameters);
%	params.original = vertcat(results.original.parameters{:}); %array2table(cell2mat(results.original.parameters));
	results.original = rmfield(results.original, 'parameters');
%	params.final = vertcat(results.parameters{:}); %array2table(cell2mat(results.parameters));
	results = rmfield(results, 'parameters');
%	formated_results.json = jsonencode(results);
%	formated_results.params = params;
	formated_results = jsonencode(results);
end
