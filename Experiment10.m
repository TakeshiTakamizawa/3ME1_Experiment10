% Observation of flow in a circular pipe and measurement of pipe friction loss coefficient
clc; close all; clear;

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
VarFluid_Log = calc_ReLambdaStd(VarFluid_Log);

% 層流・乱流で分けて計算
Laminar_flag = 0; Turbulent_flag = 0;
for i = 1:length(VarFluid_Log.ReStd)
    if VarFluid_Log.ReStd(i) < 2300 % Laminar flow region
        Laminar_flag = Laminar_flag + 1;
        j = Laminar_flag;
        VarFluid_Log.Re_Lam(j,1)          = VarFluid_Log.ReStd(i);
        VarFluid_Log.lambda_Lam(j,1)      = VarFluid_Log.lambdaStd(i);
        VarFluid_Log.RelambdaStd_Lam(j,1) = VarFluid_Log.RelambdaStd(i);
    elseif VarFluid_Log.ReStd(i) >= 2300 % Turbulent region
        Turbulent_flag = Turbulent_flag + 1;
        j = Turbulent_flag;
        VarFluid_Log.Re_Tur(j,1)          = VarFluid_Log.ReStd(i);
        VarFluid_Log.lambda_Tur(j,1)      = VarFluid_Log.lambdaStd(i);
        VarFluid_Log.RelambdaStd_Tur(j,1) = VarFluid_Log.RelambdaStd(i);
    else % transition area
    end
end

% 結果をプロット
Fontsize_num = 10.5;
plot_ReFri(VarFluid_Log, Fontsize_num)

function plot_ReFri(VarFluid_Log, Fontsize_num)
figure;
% subplot(1,3,1);
loglog(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd, VarFluid_Log.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.ReStd)-0.5*10^3 max(VarFluid_Log.ReStd)+10^4]);
ylim([min(VarFluid_Log.lambdaStd)-0.0001 max(VarFluid_Log.lambdaStd)+0.0005]);

figure;
% subplot(1,3,2);
loglog(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam, VarFluid_Log.RelambdaStd_Lam, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.Re_Lam)-0.5*10^3 max(VarFluid_Log.Re_Lam)+10^4]);
ylim([min(VarFluid_Log.lambda_Lam)-0.0001 max(VarFluid_Log.lambda_Lam)+0.0005]);

figure;
% subplot(1,3,3);
loglog(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur, VarFluid_Log.RelambdaStd_Tur, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\textbf{Reynolds Number} ($\mathrm{Re}$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
ylabel('\textbf{Friction Factor} ($\lambda$)', 'FontSize', Fontsize_num, 'Interpreter', 'latex');
title('Friction Factor vs Reynolds Number');
xlim([min(VarFluid_Log.Re_Tur)-0.5*10^3 max(VarFluid_Log.Re_Tur)+10^4]);
ylim([min(VarFluid_Log.lambda_Tur)-0.0001 max(VarFluid_Log.lambda_Tur)+0.0005]);
end