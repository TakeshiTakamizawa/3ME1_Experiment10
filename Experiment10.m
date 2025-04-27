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

%% 2 原理
% Calculate　Reynolds
VarFluid_Log = calc_VisCoeff(Data, ExpeData, Dyn_Viscosity);% Calculate dynamic viscosity coefficient
[Vm, Re] = calc_RE(Data, VarFluid_Log, ExpeData);
VarFluid_Log.Vm = Vm'; VarFluid_Log.Re = Re';

% Calculate　Pipe friction loss coefficient
D = Data.Condition.Specifications.DiameterOfCircular;
L0 = Data.Condition.Specifications.length0;
L = Data.Condition.Specifications.length;
nu = VarFluid_Log.nu;
Q = ExpeData.FlowRate;
