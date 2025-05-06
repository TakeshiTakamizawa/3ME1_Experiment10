function plot_ReFri(VarFluid_Log1, VarFluid_Log2, Fontsize_num)
figure;
% subplot(1,3,1);
loglog(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log1.ReStd, VarFluid_Log1.lambdaStd, VarFluid_Log1.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');hold on;
loglog(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); hold on;
errorbar(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd, VarFluid_Log2.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
% grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
xlim([min(VarFluid_Log1.ReStd)-0.5*10^3 max(VarFluid_Log1.ReStd)+10^4]);
ylim([min(VarFluid_Log1.lambdaStd)-0.0001 max(VarFluid_Log1.lambdaStd)+0.0005]);
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
legend('増加過程の実験値', '増加過程の誤差バー付き実験値', '減少過程の実験値', '減少過程の誤差バー付き実験値')

figure;
loglog(VarFluid_Log1.Re_Lam, VarFluid_Log1.lambda_Lam,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log1.Re_Lam, VarFluid_Log1.lambda_Lam, VarFluid_Log1.RelambdaStd_Lam, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
loglog(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); hold on;
errorbar(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd, VarFluid_Log2.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
% grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title('層流領域');
xlim([min(VarFluid_Log1.Re_Lam)-0.5*10^3 max(VarFluid_Log1.Re_Lam)+10^4]);
ylim([min(VarFluid_Log1.lambda_Lam)-0.0001 max(VarFluid_Log1.lambda_Lam)+0.0005]);
% Prandtlの式によるlambdaの数値解（乱流領域）
Re_range = logspace(log10(min(VarFluid_Log1.Re_Lam)), log10(max(VarFluid_Log1.Re_Lam)), 100);
lambda_prandtl = zeros(size(Re_range));  % 初期化

for i = 1:length(Re_range)
    Re = Re_range(i);
    fun = @(f) 1/sqrt(f) - 2.0*log10(Re*sqrt(f)) + 0.8;
    lambda_prandtl(i) = fsolve(fun, VarFluid_Log1.lambda_Lam(1), optimset('Display','off'));
end

loglog(Re_range, lambda_prandtl, 'm--', 'LineWidth', 2);
% ---- 層流理論線（λ = 64/Re）を計算して描画 ----
Re_fit_lam = logspace(log10(min(VarFluid_Log1.Re_Lam)), log10(max(VarFluid_Log1.Re_Lam)), 1000); 
lambda_lam_theory = 64 ./ Re_fit_lam; % 層流の理論式

loglog(Re_fit_lam, lambda_lam_theory, 'k--', 'LineWidth', 2); % 破線で描画
legend('増加過程の実験値', '増加過程の誤差バー付き実験値', '減少過程の実験値', '減少過程の誤差バー付き実験値', '理論式：\lambda = 64/Re', 'Prandtlの式'); % 凡例を更新
xticks([1e3 2e3 3e3 5e3 7e3 1e4 2e4 3e4])
xticklabels({'10^3','2×10^3','3×10^3','5×10^3','7×10^3','10^4','2×10^4','3×10^4'})
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');


figure;
loglog(VarFluid_Log1.Re_Tur, VarFluid_Log1.lambda_Tur,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
errorbar(VarFluid_Log1.Re_Tur, VarFluid_Log1.lambda_Tur, VarFluid_Log1.RelambdaStd_Tur, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
loglog(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); hold on;
errorbar(VarFluid_Log2.ReStd, VarFluid_Log2.lambdaStd, VarFluid_Log2.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
% grid on;
xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
title('乱流領域');
xlim([min(VarFluid_Log1.Re_Tur)-0.5*10^3 max(VarFluid_Log1.Re_Tur)+10^4]);
ylim([min(VarFluid_Log1.lambda_Tur)-0.0001 max(VarFluid_Log1.lambda_Tur)+0.0005]);
% Blasiusの式に基づくフィッティング曲線
Re_fit_tur = logspace(log10(min(VarFluid_Log1.Re_Tur)), log10(max(VarFluid_Log1.Re_Tur)), 100);
lambda_fit_tur = 0.3164 * Re_fit_tur.^(-1/4);
hold on;
loglog(Re_fit_tur, lambda_fit_tur, 'r-', 'LineWidth', 2);
legend('増加過程の実験値', '増加過程の誤差バー付き実験値', '減少過程の実験値', '減少過程の誤差バー付き実験値', '\lambda = 0.3164 Re^{-1/4}（Blasius）');
set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');

end

% function plot_ReFri(VarFluid_Log, Fontsize_num, OutputName)
% figure;
% % subplot(1,3,1);
% loglog(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
% errorbar(VarFluid_Log.ReStd, VarFluid_Log.lambdaStd, VarFluid_Log.RelambdaStd, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
% % grid on;
% xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
% ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
% title(OutputName);
% xlim([min(VarFluid_Log.ReStd)-0.5*10^3 max(VarFluid_Log.ReStd)+10^4]);
% ylim([min(VarFluid_Log.lambdaStd)-0.0001 max(VarFluid_Log.lambdaStd)+0.0005]);
% set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
% 
% figure;
% loglog(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
% errorbar(VarFluid_Log.Re_Lam, VarFluid_Log.lambda_Lam, VarFluid_Log.RelambdaStd_Lam, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
% % grid on;
% xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
% ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
% title(OutputName, '層流領域');
% xlim([min(VarFluid_Log.Re_Lam)-0.5*10^3 max(VarFluid_Log.Re_Lam)+10^4]);
% ylim([min(VarFluid_Log.lambda_Lam)-0.0001 max(VarFluid_Log.lambda_Lam)+0.0005]);
% % Prandtlの式によるlambdaの数値解（乱流領域）
% Re_range = logspace(log10(min(VarFluid_Log.Re_Lam)), log10(max(VarFluid_Log.Re_Lam)), 100);
% lambda_prandtl = zeros(size(Re_range));  % 初期化
% 
% for i = 1:length(Re_range)
%     Re = Re_range(i);
%     fun = @(f) 1/sqrt(f) - 2.0*log10(Re*sqrt(f)) + 0.8;
%     lambda_prandtl(i) = fsolve(fun, VarFluid_Log.lambda_Lam(1), optimset('Display','off'));
% end
% 
% loglog(Re_range, lambda_prandtl, 'm--', 'LineWidth', 2);
% % ---- 層流理論線（λ = 64/Re）を計算して描画 ----
% Re_fit_lam = logspace(log10(min(VarFluid_Log.Re_Lam)), log10(max(VarFluid_Log.Re_Lam)), 1000); 
% lambda_lam_theory = 64 ./ Re_fit_lam; % 層流の理論式
% 
% loglog(Re_fit_lam, lambda_lam_theory, 'k--', 'LineWidth', 2); % 破線で描画
% legend('実験値', '誤差バー付き実験値', 'Prandtlの式（数値解）', '理論式：\lambda = 64/Re'); % 凡例を更新
% set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
% 
% 
% figure;
% loglog(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur,'o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); hold on;
% errorbar(VarFluid_Log.Re_Tur, VarFluid_Log.lambda_Tur, VarFluid_Log.RelambdaStd_Tur, 'o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
% % grid on;
% xlabel('\bf Re : Reynolds Number [-] ', 'FontSize', Fontsize_num, 'Interpreter', 'tex');
% ylabel('\bf\lambda: Pipe friction factor[-]','FontSize', Fontsize_num, 'Interpreter', 'tex')
% title(OutputName, '乱流領域');
% xlim([min(VarFluid_Log.Re_Tur)-0.5*10^3 max(VarFluid_Log.Re_Tur)+10^4]);
% ylim([min(VarFluid_Log.lambda_Tur)-0.0001 max(VarFluid_Log.lambda_Tur)+0.0005]);
% % Blasiusの式に基づくフィッティング曲線
% Re_fit_tur = logspace(log10(min(VarFluid_Log.Re_Tur)), log10(max(VarFluid_Log.Re_Tur)), 100);
% lambda_fit_tur = 0.3164 * Re_fit_tur.^(-1/4);
% hold on;
% loglog(Re_fit_tur, lambda_fit_tur, 'r-', 'LineWidth', 2);
% legend('実験値', '誤差バー付き実験値', '\lambda = 0.3164 Re^{-1/4}（Blasius）');
% set(gca, 'TickLength', [0.03 0.03], 'XMinorTick', 'on', 'YMinorTick', 'on');
% 
% end