function plot_ReFri_Comp(VarFluid_Log1, VarFluid_Log2, Fontsize_num, OutputName_Inc, OutputName_Dec)
figure;
% subplot(1,2,1);
loglog(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd, VarFluid_Log1.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');hold on;
loglog(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); hold on;
errorbar(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd, VarFluid_Log2.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
% grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title(OutputName_Inc);
xlim([min(VarFluid_Log1.ReStd)-0.5*10^3 max(VarFluid_Log1.ReStd)+10^4]);
ylim([min(VarFluid_Log1.lambdaStd)-0.0001 max(VarFluid_Log1.lambdaStd)+0.0005]);
xticks([1e3 2e3 3e3 5e3 7e3 1e4 2e4 3e4])
xticklabels({'10^3','2×10^3','3×10^3','5×10^3','7×10^3','10^4','2×10^4','3×10^4'})
% yticks([1e-3 2e-3 3e-3 5e-3 7e-3 1e-2])
% yticklabels({'10^{-3}','2×10^{-3}','3×10^{-3}','5×10^{-3}','7×10^{-3}','10^{-2}'})
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
legend('増加過程の実験値', '増加過程の誤差バー付き実験値', '減少過程の実験値', '減少過程の誤差バー付き実験値')

set(gca, 'FontSize', Fontsize_num);

figure;
% subplot(1,2,2);
loglog(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd, VarFluid_Log1.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');hold on;
loglog(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); hold on;
errorbar(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd, VarFluid_Log2.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
% grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title(OutputName_Dec);
xlim([min(VarFluid_Log2.ReStd)-0.5*10^3 max(VarFluid_Log2.ReStd)+10^4]);
ylim([min(VarFluid_Log2.lambdaStd)-0.0001 max(VarFluid_Log2.lambdaStd)+0.0005]);
xticks([1e3 2e3 3e3 5e3 7e3 1e4 2e4 3e4])
xticklabels({'10^3','2×10^3','3×10^3','5×10^3','7×10^3','10^4','2×10^4','3×10^4'})
% yticks([1e-3 2e-3 3e-3 5e-3 7e-3 1e-2])
% yticklabels({'10^{-3}','2×10^{-3}','3×10^{-3}','5×10^{-3}','7×10^{-3}','10^{-2}'})
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');