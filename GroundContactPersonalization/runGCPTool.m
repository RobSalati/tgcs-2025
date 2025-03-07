GroundContactPersonalizationTool("GCPSettings.xml")

plotGcpResultsFromSettingsFile("GCPSettings.xml")
% import org.opensim.modeling.Storage
% model = Model("UF_Subject_1_Scaled_JMPSequential.osim");
% data = Storage("IKResultsSequential.mot");
% 
% [labels, time, data] = parseMotToComponents(model, data);
% 
% data = lowpassFilter(time, data', 4, 6.4, 0);
% 
% writeToSto(labels, time-time(1), data, "IKResultsSequentialFiltered.sto")