function [Vm, Re] = calc_RE(Data, VarFluid_Log, ExpeData)
% Calculate　Reynolds
D = Data.Condition.Specifications.DiameterOfCircular;
L0 = Data.Condition.Specifications.length0;
L = Data.Condition.Specifications.length;
nu = VarFluid_Log.nu;
Q = ExpeData.FlowRate;

% VarFluid
for i = 1:length(nu)
    Vm(i) = 4*Q(i)/(pi*D^2);
    Re(i) = Vm(i)*D/nu(i);
end
end