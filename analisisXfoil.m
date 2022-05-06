function [cd,cdp] = analisisXfoil(Re)
%
Reynolds = Re ;
Mach     = 0.12 ;

Filename = 'xfoil.inp' ;
texto = fopen( Filename , 'wt' );
%fprintf( texto , 'Y\n' );
fprintf( texto , 'LOAD m15.dat\n' ) ;
fprintf( texto ,'pane\n');
fprintf( texto ,'oper\n');
fprintf( texto ,'iter 200\n');
fprintf( texto ,'visc %20.6f\n', Reynolds);
fprintf( texto ,'mach %10.6f\n', Mach);
fprintf( texto ,'pacc\n');
fprintf( texto ,'\n');
fprintf( texto ,'\n');
fprintf( texto ,'cl 0.0\n');
fprintf( texto ,'pacc\n');
fprintf( texto , 'pwrt\n' );
Line = sprintf( 'm15.pol\n' ) ;
fprintf( texto , Line );
fprintf( texto ,'\n');
fprintf( texto ,'\n');
fprintf( texto ,'\n');
fprintf( texto ,'quit\n');
fclose(texto) ;
!xfoil.exe < xfoil.inp
%!./xfoil < xfoil.inp
%
%implementar la lectura de cl, cd y cm del archivo de resultados
%
PolarFile = sprintf( 'M15.pol' ) ;
PolarFileID = fopen ( PolarFile , 'rt') ;
read = 1 ;
counter = 0 ;
alpha = 100.0 ;
cl    =  10.0 ;
cd    = 100.0 ;
cdp   = 100.0 ;
cm    = 100.0 ;
xtr1  =   1.0 ;
xtr2  =   1.0 ;
while ( read == 1)
  Line = fgetl ( PolarFileID ) ;
  counter = counter + 1 ;
  if Line == -1 
      read = 0 ;
  elseif counter == 13
      data = sscanf ( Line , '%f %f %f %f %f %f %f') ;
      alpha = data(1) ;
      cl    = data(2) ;
      cd    = data(3) ;
      cdp   = data(4) ;
      cm    = data(5) ;
      xtr1  = data(6) ;
      xtr2  = data(7) ;
  end
end
fclose ( PolarFileID ) ;