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
VarFluid_Log = calc_RE(Data, VarFluid_Log, ExpeData);
% Calculate　Pipe friction loss coefficient
VarFluid_Log = calc_PipeFricLoss(Data, ExpeData, VarFluid_Log);

