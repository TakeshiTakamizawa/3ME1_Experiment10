% 固定条件
Re = 5628.66;
f = 0.014;
L = 1; % パイプ長[m]
D_list = 0:0.0005:0.1; % パイプ径[m]


% 流体定義: {名前, ρ, ν}
fluids = {
    'Water', 998, 1e-6;
    'Oil', 850, 5e-6;
    'Air', 1.2, 1.5e-5;
};

% グラフ作成
figure;
hold on;

for i = 1:size(fluids,1)
    name = fluids{i,1};
    rho = fluids{i,2};
    nu = fluids{i,3};
    
    dp_list = zeros(size(D_list));
    
    for j = 1:length(D_list)
        D = D_list(j);
        U = Re * nu / D;  % Re一定より求まる
        dp = f * (L/D) * 0.5 * rho * U^2;
        dp_list(j) = dp;
    end
    
    plot(D_list, dp_list, 'DisplayName', name, LineWidth=5);
end

xlabel('Pipe Diameter D [mm]');
ylabel('Pressure Loss ΔP [Pa]');
title('ΔP vs D at Re = 5628.66');
legend;

