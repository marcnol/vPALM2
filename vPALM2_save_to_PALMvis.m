%% fit data from MTT3D-generated .mat file (no cells) to calibration curve
%  generated by calib_mtt3d.m
function vPALM2_save_to_PALMvis(h)
% saves to VISP

nm_per_px = str2num(get(h.pixelsize,'String')) ; % nm

if get(h.chb_3dcalapplied,'Value')==1

    % 3D data 

        m0=h.m;

        % plotting data matrix
        % column 1 : x-coordinate
        % column 2 : y-coordinate
        % column 3 : z-coordinate
        % column 4 : x-width
        % column 5 : y-width
        % column 6 : x-width minus y-width
        % column 7 : intensity
        % column 8 : frame
        % plotData( :,2 ) = [matrice_results( 3,: )*nm_per_px]' ; % y-coordinate

        plotData = zeros( size(m0,1),8 ) ;
        plotData( :,1 ) = [m0( :,2 )*nm_per_px]' ; % x-coordinate
        plotData( :,2 ) = [m0( :,3 )*nm_per_px]' ; % y-coordinate
        plotData( :,3 ) = m0( :,15 )' ; % z-coordinate
        plotData( :,4 ) = m0( :,14 )' ; % y-width 
        plotData( :,5 ) = m0( :,13 )' ; % x-width
        plotData( :,6 ) = m0( :,13 )' - m0( :,14 )' ; % wx-wy
        plotData( :,7 ) = m0( :,8 )' ; % intensity %4
        plotData( :,8 ) = m0( :,1 )' ; % frame

         %index x y z fr i 
        % % D = [ zeros(length(plotData(:,1)),1) plotData(:,1) plotData(:,2) plotData(:,3) plotData(:,8) plotData(:,7) ] ;
        D = [  plotData(:,1) plotData(:,2) plotData(:,3) plotData(:,7) plotData(:,8) ] ;
        D = sortrows( D,-5 ) ;


        % add index column
        % % for u = 1:1:(length(plotData))
        % % 	D(u,1) = u ;
        % % end		

        [filename,pathname] = uiputfile( '*.3d','Save ROI',h.fullFileName) ;

        % header string
        % header = [ 'x [nm]' 'y [nm]' 'z [nm]'  'intensity' 'frame'] ;
        dlmwrite( [pathname filename],D,'delimiter','\t','-append' ) ;

else
    
    % 2d data or no calibration available

        m0=h.m;

        plotData = zeros( size(m0,1),6 ) ;
        plotData( :,1 ) = [m0( :,2 )*nm_per_px]' ; % x-coordinate
        plotData( :,2 ) = [m0( :,3 )*nm_per_px]' ; % y-coordinate
        plotData( :,7 ) = m0( :,4 )' ; % intensity
        plotData( :,8 ) = m0( :,1 )' ; % frame

         %index x y z fr i 
        % % D = [ zeros(length(plotData(:,1)),1) plotData(:,1) plotData(:,2) plotData(:,3) plotData(:,8) plotData(:,7) ] ;
        D = [  plotData(:,1) plotData(:,2) plotData(:,7) plotData(:,8) ] ;
        D = sortrows( D,-4 ) ;
    
        [filename,pathname] = uiputfile( '*.2d','Save ROI',h.fullFileName) ;

        % header string
        % header = [ 'x [nm]' 'y [nm]' 'intensity' 'frame'] ;
        dlmwrite( [pathname filename],D,'delimiter','\t','-append' ) ;

    
end





