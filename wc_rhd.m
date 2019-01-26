% Hacer wave_clus para archivos .rhd requiere separar los canales y juntar
%por tétrodo
GUI
waitfor(GUI)

for i = 9:24 % Canales de registro, desde el canal 9 al 24. (RHD2132 16-Channel Amplifier Board 1-8 y 25-32 van a tierra).
    % Separar archivo .rhd por canal en archivos .mat
        data = amplifier_data;
        BaseName = 'Channel_';
        dts = data(i,:);
        amp_ch = amplifier_channels(i)
        clear data
        data = dts;
        index = t_amplifier;
        clear dts
        sr = frequency_parameters.amplifier_sample_rate;
        fname = [BaseName,num2str(i),'.mat']
        save(fname)
        if mod(i,4) == 1
          A = i;
        end
        if mod(i,4) == 2
            B = i;
        end
        if mod(i,4) == 3
            C = i;
        end
        if mod(i,4) == 0
            D = i;
            % Cada cuatro canales genera un archivo .txt con los archivos .mat 
                formatSpec = 'Channel_%1.0f.mat\n';
                n = (i-8)/4;
                polytrode = 'polytrodeNO.txt';
                txtname = strrep(polytrode,'NO',num2str(n));
                fid = fopen(txtname,'wt');
                fprintf(fid,formatSpec,A,B,C,D);
                fclose(fid);
                waitfor(fid)
                % Generar archivos .mat que wave_clus pueda leer
                    Get_spikes_pol(n)
                    Do_clustering(n)
        end
end
% wave_clus para cada times_polytrode(i).mat se puede abrir desde GUI. Load
% data, Save clusters
wave_clus('times_polytrode1.mat')