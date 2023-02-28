::::::::: This template was initially created by Isaya at "La Couronne de Cuivre" for the mod Branwen Npc for BGII :::::::::

::::::::: This version is more exhaustive and more accessible to beginners :::::::::

:: General note on .BAT file:

:::: You can edit this file with notepad++ or any text editor ::::

:: - lines beginning with "::" are comments and are also used to disable unused code.
:: - lines beginning with ":" are labels for goto statement, used to skip blocs.

:: WARNING :: this .bat files need to be used in your game folder
:: WARNING :: this .bat files need to be in the same folder that your "ModFolder"
:: WARNING :: this .bat files need also to have weidu.exe in the same folder



:: Create the directory for traified dialogs

if exist "ModFolder"\lib_traified goto d_tra_exists
mkdir "ModFolder"\lib_traified

::Or / And

::if exist "ModFolder"\dialogue_traified goto d_tra_exists
::mkdir "ModFolder"\dialogue_traified

::Or / And

::if exist "ModFolder"\"Choose folder name"_traified goto d_tra_exists
::mkdir "ModFolder"\"Choose folder name"_traified

:d_tra_exists

:: Create the directory for traified script and tp2

if exist "ModFolder"\Other_traified goto other_tra_exists
mkdir "ModFolder"\Other_traified

::Or / And

::if exist "ModFolder"\"Choose different folder name"_traified goto other_tra_exists
::mkdir "ModFolder"\"Choose different name"_traified

:other_tra_exists

:::: This part is not tested and mostly not used ::::

:: weidu --nogame --traify Setup-Branwen.tp2 --traify-old-tra setup.tra --out setup-new --traify-comment

:: weidu --nogame --traify Anymod.tp2 --traify# 867 --out setup-new --traify-comment

::goto

:without_or_with_comment

:: INFO ::  weidu --nogame --traify "ModFolder"\"Folder"\"dialog".d   --out "ModFolder"\Dialogue_traified\"dialog" 
:: means .d or else are traified  (with each .tra file starting at @0) and (without any comment in .d)

:: INFO ::  weidu --nogame --traify "ModFolder"\"Folder"\"dialog".d     --traify-comment   --out "ModFolder"\Dialogue_traified\"dialog" 
:: means .d or else are traified (with each .tra file starting at @0) and (keep also the text in .d but "uncommented" inside /*...*/

:: INFO ::  weidu --nogame --traify "ModFolder"\"Folder"\"dialog".d      --traify#   --out "ModFolder"\Dialogue_traified\"dialog"
:: means .d or else are traified (with each files starting at @"chosen number", like this "--traify# 1100" or "--traify# 1562") but do not keep the text "uncommented" in .d 

:: INFO ::  weidu --nogame --traify "ModFolder"\"Folder"\"dialog".d       --traify-comment --traify#    --out "ModFolder"\Dialogue_traified\"dialog" 
::means .d or else are traified (with each files start at @"chosen number", like this "--traify# 1100" or "--traify# 1562") and (keep also the text in .d but "uncommented" inside /*...*/


:: Here are some examples, you have to replace the names of the files below by those of your mod and adapt the files path, one line for each .d or else.

:: "Dialogue.d Files"

weidu --nogame --traify Branwen\Dialogue\Bran.d     --out Branwen\Dialogue_traified\BranEE
weidu --nogame --traify Branwen\Dialogue\d\Bran.d   --out Branwen\Dialogue_traified\d\BranEE

weidu --nogame --traify Branwen\dialogue\minsc.d  				--traify# 500					--out Branwen\dialogue_traified\minsc
weidu --nogame --traify Branwen\dialogue\d\minsc.d  			--traify# 100000				--out Branwen\dialogue_traified\d\minsc

weidu --nogame --traify Branwen\dialogue\minsc.d    	--traify-comment				--out Anymod\dialogue_traified\anyfile
weidu --nogame --traify Branwen\dialogue\d\minsc.d  	--traify-comment				--out Anymod\dialogue_traified\anyfile

weidu --nogame --traify Branwen\dialogue\minsc.d  		--traify-comment --traify# 637 		--out Anymod\dialogue_traified\".d name"
weidu --nogame --traify Branwen\dialogue\d\minsc.d		--traify-comment --traify# 3500		--out Anymod\dialogue_traified\".d name"

weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnyFile".d  	             --traify-comment	 --out "AnyModFolder"\dialogue_traified\"AnyFile"
weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnySubFolder"\"anyfile".d  	 --traify-comment	 --out "AnyModFolder"\dialogue_traified\"AnySubfolder"\"AnyFile"

weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnyFile".d		            --traify-comment --traify# 10    --out "AnyModFolder"\dialogue_traified\"AnyFile"
weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnySubFolder"\"anyfile".d   --traify-comment --traify# 100   --out "AnyModFolder"\dialogue_traified\"AnySubFolder"\"anyfile"


:: "lib.tpa Files"

:: WARNING :: Unlike the dialog.d those files should have unique string référence for each files (@"") so use "--traify#" and start at different number to avoid same @"" in different .tra

:: Start at 1000 or 5000 or 10000 or 100000 to avoid conflict with others texts already existing

:: before choosing the starting number you need to think how much line are in the .tpa or .d or .tp2, because some files have many lines

:: .tpa or .d or .tp2 can have three or hundreds of lines.

:: You can use a large gap between each file to avoid mistakes

weidu --nogame --traify "ModFolder"\"LibFolder"\"tpa name".tpa		             --traify# 100 		    --out "ModFolder"\lib_traified\"tpa name"
weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnySubFolder"\"Anyfile".tpa	 --traify# 2000 		--out "AnyModFolder"\lib_traified\"AnySubFolder"\"Anyfile"


weidu --nogame --traify Branwen\lib\tempus.tpa	            --traify-comment --traify## 30000 		    --out Branwen\lib_traified\tempus
weidu --nogame --traify Branwen\lib\component1\Auril.tpa    --traify-comment --traify# 400000 		    --out Branwen\lib_traified\component1\Auril


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::: NOT TESTED::::::::::::::::::::::::

:: merges all .d, .tpa or else in one single .tra (every .tra @"number" should be different )

::copy .\"ModFolder"\dialogue_traified\*.tra .\dialogue_traified\dialogs.tra

::copy .\"ModFolder"\lib_traified\*.tra .\lib_traified\libs.tra

::copy .\"ModFolder"\Other_traified\*.tra .\Other_traified\All.tra 

::::::: Don't do that with the .tra of tp2 ! ::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::: Warning NOT working for "Scripts" .baf Files ::::::::::::::::: Do not use and  Traify script manually :::::::

::weidu --nogame --traify "ModFolder"\Scripts\"script name".baf --out "ModFolder"\Other_traified\"script name"
:: Maybe watch for unique string @"" too
:: WARNING :: For traify script you need to be inside you BGEE, BG2EE, EET game folder and have ACTION.IDS, EA.IDS, OBJECT.IDS and TRIGGER.IDS in your override !

::weidu --nogame --traify "ModFolder"\"script name".baf    --traify-comment --traify# 1450 	--out "ModFolder"\Other_traified\"script name"

::weidu --nogame --traify "AnyModFolder"\"AnyFolder"\"AnySubFolder"\"Anyfile".baf     --traify# 1500 	--out "AnyModFolder"\Other_traified\"AnySubFolder"\"Anyfile"

::weidu --nogame --traify Branwen\Scripts\O#BranF.baf 							--traify# 1550		--out Branwen\Other_traified\O#BranF

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: "setup.tp2 File"

:: Start at 5000 or more or less to avoid conflict with "Dialogue.tra" or else and in some case texts already in the existing Setup-"ModFolder".tra (if .tp2 already partially traified)

weidu --nogame --traify "ModFolder"\"setup-name".tp2 		--traify-comment --traify# 5000 	--out "ModFolder"\Other_traified\"setup-name"

weidu --nogame --traify "AnyModFolder"\"AnySetup-name".tp2 	--traify# 5000 			--out "AnyModFolder"\Other_traified\"AnySetup-name"

weidu --nogame --traify "AnyModFolder"\"AnySetup-name".tp2 	--traify# 10 			--out "AnyModFolder"\Other_traified\"AnySetup-name"

weidu --nogame --traify "AnyModFolder"\"AnySetup-name".tp2 	--traify-comment --traify# 700000 	--out "AnyModFolder"\Other_traified\"AnySetup-name"


:: @todo
:: Check common strings for voice over in tp2 and "some".baf


pause
