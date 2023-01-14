:: General note on .BAT file:
:: - lines beginning with "::" are comments and are also used to disable unused code.
:: - lines beginning with ":" are labels for goto statement, used to to skip blocs.
:: WARNING :: this .bat files need to be in the same folder that "ModFolder" and setup-"ModFolder".exe
:: WARNING :: this .bat files need also to have weidu.exe in the same folder

:: Create the directory for traified dialogs

if exist "ModFolder"\lib_traified goto d_tra_exists
mkdir "ModFolder"\lib_traified

::Or
::if exist "ModFolder"\dialogue_traified goto d_tra_exists
::mkdir "ModFolder"\dialogue_traified
::Or 
::if exist "ModFolder"\"Choose folder name"_traified goto d_tra_exists
::mkdir "ModFolder"\"Choose folder name"_traified

:d_tra_exists

:: Create the directory for traified script and tp2

if exist "ModFolder"\Other_traified goto other_tra_exists
mkdir "ModFolder"\Other_traified

::Or
::if exist "ModFolder"\"Choose different folder name"_traified goto other_tra_exists
::mkdir "ModFolder"\"Choose different name"_traified

:other_tra_exists

:: weidu --nogame --traify Setup-Branwen.tp2 --traify-old-tra setup.tra --out setup-new --traify-comment

:: weidu --nogame --traify Anymod.tp2 --traify# 867 --out setup-new --traify-comment

::goto

:without_or_with_comment

:: INFO :: --traify-comment = .d or else are traified (with each files begin at @0) and (keep also the text in .d but "uncommented" inside /*...*/
:: INFO :: --traify# = .d or else are traified (with each files start at @"chosen number", like this "--traify# 1100" or "--traify# 1562") but do not keep the text in .d 
:: INFO :: --traify-comment --traify# = .d or else are traified (with each files start at @"chosen number", like this "--traify# 1100" or "--traify# 1562") and (keep also the text in .d but "uncommented" inside /*...*/

:: "Dialogue.d Folder"

weidu --nogame --traify Branwen\dialogue\minscj.d  									--traify# 500				--out Branwen\dialogue_traified\minscj
weidu --nogame --traify Anymod\Anyfolder\dialogue\anyfile.d  	--traify-comment			--out Anymod\dialogue_traified\anyfile
weidu --nogame --traify "ModFolder"\dialogue\".d name".d				 			--traify-comment --traify# 				--out Anymod\dialogue_traified\".d name"
weidu --nogame --traify "ModFolder"\dialogue\".d name".d				 			 --traify-comment --traify# 			--out Anymod\dialogue_traified\".d name"

:: "lib".tpa Folder
:: start at 1000 or 5000 or 10000 or 100000 to avoid conflict with others texts already existing
:: WARNING :: Unlike the dialog.d those files should have unique string référence for each files (@"") so use --traify# and start at different number to avoid same @"" in different .tra

weidu --nogame --traify "ModFolder"\lib\"tpa name".tpa				 --traify# 100 			--out Anymod\lib_traified\aamage
weidu --nogame --traify "ModFolder"\"folder name"\"tpa name".tpa	 --traify# 2000 		--out Anymod\lib_traified\adventurer
weidu --nogame --traify Branwen\lib\tempus.tpa	 					 --traify-comment --traify## 30000 		--out Branwen\lib_traified\tempus
weidu --nogame --traify Anymod\lib\ArcaneArcher.tpa		 --traify-comment --traify# 400000 		--out Anymod\lib_traified\ArcaneArcher


:: NOT TESTED::::::::::::::::::::::::

::copy .\"ModFolder"\dialogue_traified\*.tra .\dialogue_traified\dialogs.tra
::copy .\"ModFolder"\lib_traified\*.tra .\lib_traified\libs.tra
::copy .\"ModFolder"\Other_traified\*.tra .\Other_traified\scripts.tra :: Move tp2 traified first ! ::::::::

::::::::::::::::::::::::

:: "Scripts" .baf Folder : 
::weidu --nogame --traify "ModFolder"\Scripts\"script name".baf --out "ModFolder"\Other_traified\"script name"
:: Maybe watch for unique string @"" too
:: WARNING :: For traify script you need to be inside you BGEE, BG2EE, EET game folder and have ACTION.IDS, EA.IDS, OBJECT.IDS and TRIGGER.IDS in your override !

::weidu --nogame --traify "ModFolder"\"script name".baf 							--traify-comment --traify# 1450 		--out "ModFolder"\Other_traified\"script name"
::weidu --nogame --traify Anymod\Ranger\berserkerminsc\scripts\minsc.baf --traify# 1500 		--out Branwen\Other_traified\O#BranF
::weidu --nogame --traify Branwen\Scripts\O#BranF.baf 							--traify# 1550		--out Anymod\Other_traified\minsc

:: tp2
:: start at 5000 or else to avoid conflict with "Dialogue.dFolder"s or else and texts already in the existing English\Setup-"ModFolder".tra

weidu --nogame --traify "ModFolder"\"setup name".tp2 			--traify-comment --traify# 5000 			--out "ModFolder"\Other_traified\"setup name"
weidu --nogame --traify Anymod\Anymod.tp2 	--traify# 5000 			--out Anymod\Other_traified\Anymod

:: @todo
:: Check common strings for voice over in tp2 and "some".baf


pause
