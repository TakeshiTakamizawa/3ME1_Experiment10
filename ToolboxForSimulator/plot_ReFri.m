function plot_ReFri(VarFluid_Log, Fontsize_num, OutputName)
figure;
% subplot(1,3,1);
loglog(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd, VarFluid_Log.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title(OutputName);
xlim([min(VarFluid_Log.ReStd)-0.5*10^3 max(VarFluid_Log.ReStd)+10^4]);
ylim([min(VarFluid_Log.lambdaStd)-0.0001 max(VarFluid_Log.lambdaStd)+0.0005]);

figure;
loglog(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam, VarFluid_Log.RelambdaStd_Lam, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title(OutputName, '層流領域');
xlim([min(VarFluid_Log.Re_Lam)-0.5*10^3 max(VarFluid_Log.Re_Lam)+10^4]);
ylim([min(VarFluid_Log.lambda_Lam)-0.0001 max(VarFluid_Log.lambda_Lam)+0.0005]);

figure;
loglog(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur, VarFluid_Log.RelambdaStd_Tur, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title(OutputName, '乱流領域');
xlim([min(VarFluid_Log.Re_Tur)-0.5*10^3 max(VarFluid_Log.Re_Tur)+10^4]);
ylim([min(VarFluid_Log.lambda_Tur)-0.0001 max(VarFluid_Log.lambda_Tur)+0.0005]);
end