clear all
close all

TrackingOptimizationTool("TrackingOptimizationSettingsSequential.xml")
% TrackingOptimizationTool("TrackingOptimizationSettingsSimultaneous.xml")
plotTreatmentOptimizationResultsFromSettingsFile("TrackingOptimizationSettingsSequential.xml")
%%
% import org.opensim.modeling.Storage
% model = Model("UF_Subject_1_Scaled_JMPSequential.osim");
% 
% %%
% data = Storage("Copy_of_Trial12_Walking_forces_ec_reordered_filtered.mot");
% 
% [labels, time, data] = parseMotToComponents(model, data);
% 
% writeToSto(labels, time-time(1), data', "TOInputsSequential\GRFData\gait_1.sto")
% 
% %%
% data = Storage("IDResultsSequential.sto");
% 
% [labels, time, data] = parseMotToComponents(model, data);
% 
% data = lowpassFilter(time, data', 4, 6.4, 0);
% 
% writeToSto(labels, time-time(1), data, "TOInputsSequential\IDData\gait_1.sto")
% 
% %%
% data = Storage("IKResultsSequentialFiltered.sto");
% 
% [labels, time, data] = parseMotToComponents(model, data);
% 
% % data = lowpassFilter(time, data', 4, 6.4, 0);
% 
% writeToSto(labels, time-time(1), data', "TOInputsSequential\IKData\gait_1.sto")
% 
% %%
% %%
% plotTreatmentOptimizationJointLoads("IDResultsSequential.sto", ...
%     "TOInputsSequential\IDData\gait_1.sto")
% 
% plotTreatmentOptimizationJointAngles("UF_Subject_1_Scaled_JMPSequential.osim", ...
%     "TOInputsSequential\IKData\gait_1.sto", "TOInputsSequential\IKData\gait_1.sto")
% 
% plotTreatmentOptimizationGroundReactions("TOInputsSequential\GRFData\gait_1.sto", ...
%     "TOInputsSequential\GRFData\gait_1.sto")