% Observation of flow in a circular pipe and measurement of pipe friction loss coefficient
clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
ExpeData_Inc   = readtable('ExperimentalData_Increase.xlsx');
ExpeData_Dec   = readtable('ExperimentalData_Decrease.xlsx');
Dyn_Viscosity  = readtable('Dyn_Viscosity.xlsx');

importfolder   = 'ToolboxForSimulator/condition';
importfilename = 'Condition.xlsx'; % 条件のファイル
Data           = dataimport(importfolder,importfilename,[]);
CriRe_Inc = 6045; % Increase Critical Reynolds number
CriRe_Dec = 6030; % Decrease Critical Reynolds number

%% 2原理
% Calculate Reynolds
VarFluid_LogInc = calc_ReLam(Data, ExpeData_Inc, Dyn_Viscosity); % Increase
VarFluid_Logdec = calc_ReLam(Data, ExpeData_Dec, Dyn_Viscosity); % Decrease

%% 結果をプロット
Fontsize_num = 10.5;
OutputName_Inc = '増加過程'; OutputName_Dec = '減少過程';
plot_ReFri(VarFluid_LogInc, Fontsize_num, OutputName_Inc)
plot_ReFri(VarFluid_Logdec, Fontsize_num, OutputName_Dec)
% § 5.6
plot_ReFri_Comp(VarFluid_LogInc, VarFluid_Logdec, Fontsize_num, OutputName_Inc, OutputName_Dec)
% § 5.8

% figure;
% plot(VarFluid_LogInc.Vm, VarFluid_LogInc.Re, 'o')