% Definir la c�mara de adquisici�n de frames
cam = webcam(2)
% Generar el archivo
vidWriter = VideoWriter('frames.avi');
open(vidWriter);

for index = 1:7500
    % Acquire frame for processing
    img = snapshot(cam);
    % Write frame to video
    writeVideo(vidWriter, img);
end

close(vidWriter)