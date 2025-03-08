import org.opensim.modeling.Storage

model = Model("..\JointModelPersonalization\UF_Subject_1_Scaled_JMPSequential.osim");

errorFile1 = "IKErrorsScaledGeneric2.sto";
errorFile2 = "IKErrorsSequential2.sto";
errorFile3 = "IKErrorsSimultaneous2.sto";

% errorFile1 = "IKErrorsSimultaneousNoGaitWithGait.sto";
% errorFile2 = "IKErrorsSimultaneousWithGaitWithGait.sto";
% errorFile2 = "IKErrorsSequentialBottomUp.sto";

[~, ~, errors1] = parseMotToComponents(model, Storage(errorFile1));
[~, ~, errors2] = parseMotToComponents(model, Storage(errorFile2));
[~, time, errors3] = parseMotToComponents(model, Storage(errorFile3));
% [~, ~, errors4] = parseMotToComponents(model, Storage(errorFile4));
% [~, ~, errors5] = parseMotToComponents(model, Storage(errorFile5));

cropIndices = time>12.65 & time<13.675;

croppedTime = time(cropIndices);
croppedTime = (croppedTime - croppedTime(1));
croppedTime = croppedTime/croppedTime(end)*100;

meanSquaredError1 = mean(errors1(1,:));
meanSquaredError2 = mean(errors2(1,:));
% meanSquaredError3 = mean(errors3(1,:));

meanRMSError1 = mean(errors1(2,cropIndices)*1000);
meanRMSError2 = mean(errors2(2,cropIndices)*1000);
meanRMSError3 = mean(errors3(2,cropIndices)*1000);

maxRMSError1 = max(errors1(2, cropIndices)*1000);
maxRMSError2 = max(errors2(2, cropIndices)*1000);
maxRMSError3 = max(errors3(2, cropIndices)*1000);

figure()
% hold on
% plot(errors1(1,:))
% plot(errors2(1,:))
% plot(errors3(1,:))
% plot(errors4(1,:))
% hold off
% legend(" Sequential", "no gait with gait", "withn gait", "with gait with gait")
hold on
plot(croppedTime, errors1(2,cropIndices)*1000, Color="#4477AA", Linewidth=5)
plot(croppedTime, errors2(2,cropIndices)*1000, Color="#EE6677", Linewidth=5)
plot(croppedTime, errors3(2,cropIndices)*1000, Color="#228833", Linewidth=5)
xlabel("Percent Gait Cycle [0-100%]")
ylabel("RMS Error [mm]")
set(gca, fontsize = 20)
% plot(croppedTime, errors3(1,cropIndices)*1000, Color="#228833", Linewidth=3)
% plot(errors4(1,:))
% plot(errors5(1,:))
legend("Scaled Generic", "Sequential", "Simultaneous",...
    "Scaled Generic", "With gait with gait", "Sequential", fontsize=25)
hold off
xlim('tight')

plotTreatmentOptimizationJointAngles("..\JointModelPersonalization\UF_Subject_1_Scaled_JMPSequential.osim", ...
    "IKResultsScaledGenericCropped.mot", ["IKResultsSequentialCropped.mot", "IKResultsSimultaneousCropped.mot"])