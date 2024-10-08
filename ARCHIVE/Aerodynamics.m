%% This script is for visualization and interpolation of the aerodynamics equation of wind turbine
theta_arr = -1:0.1:25;
omega_g_arr = 50:10:200;

Pr = cell(length(omega_g_arr),1);
% p_aer = cell(length(omega_g_arr),1);

for i = 1:length(omega_g_arr)
[Pr{i},~] = getAerodynamics(omega_g_arr(i)*1/Ng,theta_arr,v);

p_aer(i,:) = polyfit(theta_arr,Pr{i},2);

% p_aer{i} = polyfit(theta_arr,Pr{i},2);

end


%% PLOTTING
% close all;
% figure
% 
% for i = 1:length(Pr)
% hold on
% % plot(theta_arr, Pr{i},'x')
% plot(theta_arr,polyval(p_aer{i},theta_arr),'DisplayName',num2str(omega_g_arr(i)))
% end
% hold off
% 
% xlim([min(theta_arr), max(theta_arr)])
% xlabel('theta')
% ylabel('Pr')
% legend
