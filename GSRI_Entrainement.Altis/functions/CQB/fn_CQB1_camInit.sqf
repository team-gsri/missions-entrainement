if!(isNil "feedbackcam_cqb1") then {deleteVehicle feedbackcam_cqb1};
feedback_cqb1 setObjectTexture [0, "#(argb,512,512,1)r2t(camfeed_cqb1,2.3)"];
feedbackcam_cqb1 = "camera" camCreate getPosATL camera_cbq_individuel;
feedbackcam_cqb1 camSetTarget cone_cqb_1;
feedbackcam_cqb1 camSetFov 0.65;
feedbackcam_cqb1 camCommit 0;
feedbackcam_cqb1 cameraEffect ["Internal", "Back", "camfeed_cqb1"];
