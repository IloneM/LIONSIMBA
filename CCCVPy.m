% TODO : add a recursive filter for class function_handle
function formated_results = startSimulationPy(input_density)
	% time
	t0 = 0;
	tf = 10^4;

	% Parameters
	param{1} = Parameters_init(20.0);
	param{1}.Tmax = 313.15 * 0.995;
	param{1}.Tref = 300.0;
	param{1}.T_init = 303.15;
	param{1}.CutoverVoltage = 4.1;
	param{1}.CutoverSOC = 80.0;

	% Define the initial state structure
	initialState.Y  = [];
	initialState.YP = [];

	out = startSimulation(t0,tf,initialState,input_density,param);

	jsonable_out = out;
	jsonable_out.original = rmfield(out.original, 'parameters');
	jsonable_out = rmfield(jsonable_out, 'parameters');

	if(out.SOC{1}(end) < param{1}.CutoverSOC)
		%% Constant Voltage
		initialState = out.initialState;
		% Define a new parameter strutcutre for CV cycling
		param2 = param;

		% Empty the Jacobian matrix!! During the CV stage, the set of equations
		% changes
		param2{1}.JacobianFunction = [];

		% Potentiostatic operations
		param2{1}.OperatingMode = 3;
		% Change the cutover voltage to avoid simulation interruptions
		param2{1}.CutoverVoltage = 4.3;
		param2{1}.Tmax = 313.15;
		% Potentiostatic reference
		param2{1}.V_reference = out.Voltage{1}(end);

		t0 = out.time{1}(end);

		% Run the simulation in CV
		out2 = startSimulation(t0,tf,initialState,0,param2);
		jsonable_out2 = out2;
		jsonable_out2.original = rmfield(out2.original, 'parameters');
		jsonable_out2 = rmfield(jsonable_out2, 'parameters');

		formated_results = jsonencode({jsonable_out, jsonable_out2});
	else
		formated_results = jsonencode({jsonable_out});
	end
end