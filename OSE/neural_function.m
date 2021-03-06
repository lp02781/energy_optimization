function [Y,Xf,Af] = neural_function(X,~,~)
%NEURAL_FUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Jul-2021 16:21:17.
% 
% [Y] = neural_function(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 2xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.918223613420718;-1];
x1_step1.gain = [1.13324465136903;1.06607806275458];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.2432651480913907704;-2.3606314376871311289;0.2088436700658310996;0.28265771348849194622;1.34974858151399979;1.7596918699687069676];
IW1_1 = [-2.5160958002146309731 2.0751469271209872502;5.6784719607451652479 -0.88237270309036974769;-2.7827679683202171113 -2.2678314082811334984;-1.6472334334623590646 -4.4166483872467505734;1.0308911500656101623 4.5183728553892175128;-1.1722906256035878769 -2.824137878699403359];

% Layer 2
b2 = -1.2320705723153186906;
LW2_1 = [1.2915700509478311719 0.21647279152523241086 -0.22078908893693000026 -0.56440899795025656349 -0.17284578363679661828 0.45916157578660088401];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1.02740984743412;
y1_step1.xoffset = -1;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
