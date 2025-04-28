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
        VarFluid_Log.lambda_Lam(j,1) = VarFluid_Log.lambda(i);
    elseif VarFluid_Log.Re(i) > 4000 % Turbulent region
        Turbulent_flag = Turbulent_flag + 1;
        j = Turbulent_flag;
        VarFluid_Log.Re_Tur(j,1) = VarFluid_Log.Re(i);
        VarFluid_Log.lambda_Tur(j,1) = VarFluid_Log.lambda(i);
    else % transition area
    end
end

% 結果をプロット
Fontsize_num = 10.5;
figure;
% subplot(1,3,1);
loglog(VarFluid_Log.Re, VarFluid_Log.lambda, '*', 'LineStyle', 'none', 'LineWidth', 5, 'Color', 'blue');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.Re)-0.5*10^3 max(VarFluid_Log.Re)+10^4]);
ylim([min(VarFluid_Log.lambda)-0.0001 max(VarFluid_Log.lambda)+0.0005]);

figure;
% subplot(1,3,2);
loglog(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam, '*', 'LineStyle', 'none', 'LineWidth', 5, 'Color', 'blue');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.Re_Lam)-0.5*10^3 max(VarFluid_Log.Re_Lam)+10^4]);
ylim([min(VarFluid_Log.lambda_Lam)-0.0001 max(VarFluid_Log.lambda_Lam)+0.0005]);

figure;
% subplot(1,3,3);
loglog(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur, '*', 'LineStyle', 'none', 'LineWidth', 5, 'Color', 'blue');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.Re_Tur)-0.5*10^3 max(VarFluid_Log.Re_Tur)+10^4]);
ylim([min(VarFluid_Log.lambda_Tur)-0.0001 max(VarFluid_Log.lambda_Tur)+0.0005]);