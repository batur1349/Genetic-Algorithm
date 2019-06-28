clc; clear; close all;
%% Problem Definition
CostFunction = @(x) Custom(x);      % Cost Function
nVar = 3;             				% Number of Decision Variables
VarSize = [1 nVar];   				% Decision Variables Matrix Size
VarMin = 0;         				% Lower Bound of Variables
VarMax = 100;         				% Upper Bound of Variables

%% GA Parameters
MaxIt = 1000;                       % Maximum Number of Iterations
nPop = 100;                         % Population Size
pc = 0.8;                           % Crossover Percentage
mu = 0.1;                           % Mutation Rate

%ANSWER = questdlg('Choose if floating points or integers:', 'Floating Points', ...
%	'Integers');
%FloatingPoints = strcmp(ANSWER, 'Floating Points');
%Integers = strcmp(ANSWER, 'Integers');

%% Initialization
empty_individual.Position = [];
empty_individual.Cost = [];
pop = repmat(empty_individual, nPop, 1);

for i = 1 : nPop
    % Initialize Chromosome
    pop(i).Position = randi([VarMin, VarMax], 1, VarSize(2));
    % Evaluation
    pop(i).Cost = CostFunction(pop(i).Position);
end
% Sort Population
Costs = [pop.Cost];
[Costs, SortOrder] = sort(Costs);
pop = pop(SortOrder);
% Store Best Solution
BestSol = pop(1);
% Array to Hold Best Cost Values
BestCost = zeros(MaxIt, 1);
% Store Cost
WorstCost = pop(end).Cost;

%% Main Loop
for it = 1 : MaxIt
    % Crossover
    pop = Crossover(pop, pc, VarMin, VarMax);    
    % Mutation
    pop = Mutate(pop, mu, VarMin, VarMax);
    % Evaluate Offsprings
    %for i = round(size(pop, 1) * (1 - pc) + 1) : size(pop, 1)
	for i = 1 : size(pop, 1)
        pop(i).Cost = CostFunction(pop(i).Position);
    end
    % Sort Population
    Costs = [pop.Cost];
    [Costs, SortOrder] = sort(Costs);
    pop = pop(SortOrder);
    % Update Worst Cost
    WorstCost = max(WorstCost, pop(end).Cost);
    % Store Best Solution Ever Found
    BestSol = pop(1);
    % Store Best Cost Ever Found
    BestCost(it) = BestSol.Cost;
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
end

disp(['Best Solution : ' num2str(BestSol.Position)]);
figure;
semilogy(BestCost,'LineWidth',2);
% plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Cost');
grid on;