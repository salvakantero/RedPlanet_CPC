@echo off

if [%1]==[help] goto :help

set game=redplanet
set cpc_gfx_mode=1

if [%1]==[justcompile] goto :compile
if [%1]==[clean] goto :clean

cd ..\script
if not exist %game%.spt goto :noscript
echo Compilando script
..\utils\msc3_mk1.exe %game%.spt 30 > nul
rem copy msc.h ..\dev\my > nul
copy msc-config.h ..\dev\my > nul
copy scripts.bin ..\dev\ > nul
:noscript
cd ..\dev

if [%1]==[justscripts] goto :compile

echo Convirtiendo mapa
..\utils\mapcnv.exe ..\map\mapa.map assets\mapa.h 5 6 15 10 15 packed > nul

echo Convirtiendo enemigos/hotspots
..\utils\ene2h.exe ..\enems\enems.ene assets\enems.h

echo Comprimiendo OGT
..\utils\apultra.exe ..\mus\00_title.mus ..\mus\00_title.mus.bin
..\utils\apultra.exe ..\mus\01_ingame.mus ..\mus\01_ingame.mus.bin
..\utils\apultra.exe ..\mus\02_none.mus ..\mus\02_none.mus.bin
..\utils\apultra.exe ..\mus\03_gameover.mus ..\mus\03_gameover.mus.bin

if [%1]==[nogfx] goto :compile

echo Importando GFX
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=chars in=..\gfx\font.png out=..\bin\font.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=strait2x2 in=..\gfx\work.png out=..\bin\work.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites.png out=..\bin\sprites.bin mappings=assets\spriteset_mappings.h silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra.png out=..\bin\sprites_extra.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_bullet.png out=..\bin\sprites_bullet.bin metasize=1,1 silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra2.png out=..\bin\sprites_extra2.bin silent > nul
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=sprites in=..\gfx\sprites_extra3.png out=..\bin\sprites_extra3.bin silent > nul

..\utils\png2scr.exe ..\gfx\title.png ..\gfx\title.scr > nul

..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\title.png out=..\bin\title.bin silent > nul
rem ..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\marco.png out=..\bin\marco.bin silent > nul
rem ..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal.png mode=superbuffer in=..\gfx\ending.png out=..\bin\ending.bin silent > nul

..\utils\apultra.exe ..\bin\title.bin ..\bin\titlec.bin > nul
rem ..\utils\apultra.exe ..\bin\marco.bin ..\bin\marcoc.bin > nul
rem ..\utils\apultra.exe ..\bin\ending.bin ..\bin\endingc.bin > nul

rem ..\utils\mkts_om.exe platform=cpc mode=pals in=..\gfx\pal.png prefix=my_inks out=assets\pal.h silent > nul

if [%1]==[justassets] goto :end

:compile
echo Generating LUTs
..\utils\pasmo.exe assets\cpc_TrPixLutM%cpc_gfx_mode%.asm assets\trpixlut.bin
..\utils\apultra.exe assets\trpixlut.bin assets\trpixlutc.bin
..\utils\wyzTrackerParser.exe ..\mus\instrumentos.asm my\wyz\instrumentos.h

echo Compilando guego
zcc +cpc -m -vn -O3 -unsigned -crt0=crt.asm -zorg=1024 -lcpcrslib -DCPC_GFX_MODE=%cpc_gfx_mode% -o %game%.bin tilemap_conf.asm mk1.c > nul
..\utils\printsize.exe %game%.bin
..\utils\printsize.exe scripts.bin

echo Construyendo Snapshot %game%.sna
del %game%.sna > nul
..\utils\cpctbin2sna.exe %game%.bin 0x400 -pc 0x400 -o %game%.sna

if [%2]==[andtape] goto :tape
if [%1]==[justcompile] goto :end

:clean
:tape
echo Construyendo cinta
..\utils\mkts_om.exe platform=cpc cpcmode=%cpc_gfx_mode% pal=..\gfx\pal_loading.png mode=scr in=..\gfx\loading.png out=..\bin\loading.bin silent > nul
del ..\bin\loading.c.bin >nul 2>nul
..\utils\zx7.exe ..\bin\loading.bin ..\bin\loading.c.bin > nul
del ..\bin\%game%.c.bin >nul 2>nul
..\utils\zx7.exe %game%.bin ..\bin\%game%.c.bin > nul

..\utils\imanol.exe in=loader\loadercpc.asm-orig out=loader\loadercpc.asm ^
	scrc_size=?..\bin\loading.c.bin ^
	mainbin_size=?..\bin\%game%.c.bin ^
	loading_palette=!..\gfx\pal_loading.png ^
	loader_mode=%cpc_gfx_mode% > nul
..\utils\pasmo.exe loader\loadercpc.asm ..\bin\loader.bin  > nul

..\utils\imanol.exe in=loader\preloadercpc.asm-orig out=loader\preloadercpc.asm ^
	loader_size=?..\bin\loader.bin ^
	loader_mode=%cpc_gfx_mode% > nul
..\utils\pasmo.exe loader\preloadercpc.asm ..\bin\preloader.bin  > nul

del %game%.cdt > nul
..\utils\cpc2cdt.exe -r %game% -m cpc -l 1024 -x 1024 -p 2000 ..\bin\preloader.bin %game%.cdt
..\utils\cpc2cdt.exe -r LOADER -m raw1full -rl 740 -p 2000 ..\bin\loader.bin %game%.cdt
..\utils\cpc2cdt.exe -r SCR -m raw1full -rl 740 -p 2000 ..\bin\loading.c.bin %game%.cdt
..\utils\cpc2cdt.exe -r MAIN -m raw1full -rl 740 -p 2000 ..\bin\%game%.c.bin %game%.cdt

REM echo Construyendo disco
REM copy ..\bin\%game%.c.bin game.bin > nul 
REM copy ..\bin\base.dsk %game%.dsk > nul 
REM copy ..\bin\loading.c.bin loading.bin > nul
REM echo compilando cargador de disco
REM ..\utils\pasmo.exe loader\loader_disco.asm disc.bin
REM echo agregando archivos al disco
REM ..\utils\CPCDiskXP\CPCDiskXP.exe -File disc.bin 00ff -AddToNewDsk %game%.dsk
REM ..\utils\CPCDiskXP\CPCDiskXP.exe -File loading.bin -AddAmsDosHeader C000 -AddToExistingDsk %game%.dsk
REM ..\utils\CPCDiskXP\CPCDiskXP.exe -File game.bin -AddAmsDosHeader 0400 -AddToExistingDsk %game%.dsk
REM **** RECORDATORIO COMO HACER UN DSK ****
REM HICIMOS EL DSK CON LA HERRAMIENTA MANAGE DSK Y CON EL CARGADOR DE JGN EN ASM. 
REM SE CARGA EL DSK CON LOS BINARIOS EN LA UNIDAD A DE DISCO EN WINAPE.
REM SE CARGA EL CARGADOR ASM EN WINAPE: SE LE DA A F3, FILE->OPEN. 
REM LUEGO F9 PARA EJECUTARLO. ÉL SOLO ESCRIBE EL FICHERO DISC.BIN EN EL DSK QUE HAY CARGADO EN WINAPE.

goto :end 

:help
echo "compile.bat help|justcompile|clean|justscripts|justassets|nogfx"

:end
echo Hecho!
time /T
