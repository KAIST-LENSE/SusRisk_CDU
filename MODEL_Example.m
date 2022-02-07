
function EvalMetrics = MODEL_Example(kp)   
%% Declare Global Variables
format long g
%% KEY PARAMETERS WITH UNCERTAINTY

p1 = kp(1);                 % x1
p2 = kp(2);                 % x2
p3 = kp(3);                 % x3
y = p1 - p2 + 10*p3;


%% EXPORT SUSTAINABILITY CRITERIA METRICS
EvalMetrics = [y];  
end

% Very low probability to reach 6 or higher with the above
% Near the middle of the distribution, the sobol indices and the risk
% scores are more or less consistent (most sensitivity to P3)

% Near the tails any combination of values affect the outcome so P1, P2 and 
% P3 are all attributed a high risk. Decision criteria for base case is set
% to 10 and for the extreme case, is set to 9

% Risk score at criteria 10.5
% x1 = 0.295925783355335
% x2 = 0.295013116102354
% x3 = 1.14350303554357

% Risk score at criteria 9
% 0.701980014420112
% 0.639229035155817
% 0.972946092835286


% E[x1] = 8/2+8 = 0.8
% E[x2] = 2/2+8 = 0.2