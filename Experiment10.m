% Observation of flow in a circular pipe and measurement of pipe friction loss coefficient
clc; close all; clear;

%% setting condition
addpath(genpath('ToolboxForSimulator'));
ExpeData_Inc  = readtable('ExperimentalData_Increase.xlsx');
ExpeData_Dec  = readtable('ExperimentalData_Decrease.xlsx');
Dyn_Viscosity = readtable('Dyn_Viscosity.xlsx');

importfolder = 'ToolboxForSimulator/condition';
importfilename = 'Condition.xlsx'; % 条件のファイル
Data = dataimport(importfolder,importfilename,[]);

%% 2原理
% Calculate　Reynolds
VarFluid_LogInc = calc_ReLam(Data, ExpeData_Inc, Dyn_Viscosity);
VarFluid_Logdec = calc_ReLam(Data, ExpeData_Dec, Dyn_Viscosity);

%% 結果をプロット
Fontsize_num = 10.5;
plot_ReFri(VarFluid_LogInc, Fontsize_num)
plot_ReFri(VarFluid_Logdec, Fontsize_num)