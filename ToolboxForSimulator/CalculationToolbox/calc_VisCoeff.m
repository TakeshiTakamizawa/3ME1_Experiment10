function VarFluid = calc_VisCoeff(Data, ExpeData, Dyn_Viscosity)
% Calculate dynamic viscosity coefficient

VarFluid.mu_mPas = calc_DynViscosity(ExpeData, Dyn_Viscosity); % Calculate DynViscosity
mu_Pas           = VarFluid.mu_mPas * 1e-3;   % mPa·s を Pa·s に変換
VarFluid.rho     = calc_Density(Data, ExpeData);

for i = 1:length(mu_Pas)
    VarFluid.nu(i,1) = mu_Pas(i) / VarFluid.rho(i);         % 動粘性係数 [m^2/s]
end
end