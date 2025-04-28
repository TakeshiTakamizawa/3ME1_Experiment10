% Observation of flow in a circular pipe and measurement of pipe friction loss coefficient
clc
close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
ExpeData      = readtable('ExperimentalData.xlsx');
Dyn_Viscosity = readtable('Dyn_Viscosity.xlsx');

importfolder = 'ToolboxForSimulator/condition';
importfilename = 'Condition.xlsx'; % 条件のファイル
Data = dataimport(importfolder,importfilename,[]);

%% 2原理
% Calculate　Reynolds
VarFluid_Log = calc_VisCoeff(Data, ExpeData, Dyn_Viscosity); % Calculate dynamic viscosity coefficient


% 層流・乱流で分けて計算
Laminar_flag = 0;
Turbulent_flag = 0;
for i = 1:length(VarFluid_Log.Re)
    if VarFluid_Log.Re(i) < 2300 % Laminar flow region
        Laminar_flag = Laminar_flag + 1;
        j = Laminar_flag;
        VarFluid_Log.Re_Lam(j,1) = VarFluid_Log.Re(i);
    elseif VarFluid_Log.Re(i) > 4000 % Turbulent region
        Turbulent_flag = Turbulent_flag + 1;
        j = Turbulent_flag;
        VarFluid_Log.Re_Tur(j,1) = VarFluid_Log.Re(i);
    else % transition area
    end
end

% 結果をプロット
figure;
loglog(VarFluid_Log.Re, VarFluid_Log.lambda, 'LineWidth', 2);
grid on;
xlabel('Reynolds Number (Re)');ylabel('Friction Factor (λ)');
title('Friction Factor vs Reynolds Number');
xlim([100 100000]);ylim([0.0005 1]);

