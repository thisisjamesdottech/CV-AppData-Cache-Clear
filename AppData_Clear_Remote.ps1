<#
ScriptName: AppData Cache Clear - Remote Manager
Purpose:    Provide remote management of AppData cache for end user consoles using CompleteView Desktop Client 2020
Author:     James Anderson, Escalation Engineer, Salient Systems
Date:       07Jan2021
Version:    1.5
Comments:   In production

Version History:
 -  :    (23Dec2020)  1.0 Initial BETA
 -  :    (23Dec2020)  1.1 Added minor build since one is the lonliest number
 -  :    (28Dec2020)  1.2 Configured Do-Until loop for hostname, NTID, and CV username
 -  :    (28Dec2020)  1.3 Added Background and Foreground Colors to console messages for UX
 -  :    (30Dec2020)  1.4 Configured Do-Until loop for entire script in case there are multiple users needing assistance at once
 -  :    (07Jan2021)  1.5 Added $ to the readback variables because I was an idiot and missed it the first time; for reference see https://xkcd.com/1739/
#>
cls
Write-Host ""
Write-Host " " -NoNewline; Write-Host "##################################################" -ForegroundColor Black -BackgroundColor White -NoNewline; Write-Host "    ###" -ForegroundColor Red
Write-Host " " -NoNewline; Write-Host "#      AppData Cache Clear - Remote Manager      #" -ForegroundColor Black -BackgroundColor White -NoNewline; Write-Host "   ##  " -ForegroundColor Red -NoNewline; Write-Host "#" -ForegroundColor White
Write-Host " " -NoNewline; Write-Host "##################################################" -ForegroundColor Black -BackgroundColor White -NoNewline; Write-Host "    #" -ForegroundColor Red -NoNewline; Write-Host "##" -ForegroundColor White
Start-Sleep -Seconds 3
cls
Do {
	Do {
		$computer = Read-Host "What is the target computer hostname?"
		Write-Host ""
		Write-Host "You have entered " -ForegroundColor White -BackgroundColor Black -NoNewline; Write-Host "$computer" -ForegroundColor Yellow -BackgroundColor Black -NoNewline; Write-Host " - Is that correct?" -ForegroundColor White -BackgroundColor Black
		Write-Host ""
		Write-Host "[ Y / N ]"
		Write-Host ""
		Write-Host -nonewline "Please type your choice and press Enter: "
		$choiceB = Read-Host
		Write-Host ""
		       
		$ok = $choiceB -match '^[y]+$'
		       
		If ( -not $ok) {
			Write-Host ""
			Write-Host "Please type your computer hostname again" -ForegroundColor Red -BackgroundColor Black
			Write-Host ""
			Start-Sleep -Seconds 3
			cls
			#Write-Host "Press any key to continue ..." -ForegroundColor Cyan
			#$x = $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
		}
	} Until ( $ok )
	cls
	Do {
		$ntid = Read-Host "What is the user NTID for the computer in question?"
		Write-Host ""
		Write-Host "You have entered " -ForegroundColor White -BackgroundColor Black -NoNewline; Write-Host "$ntid" -ForegroundColor Yellow -BackgroundColor Black -NoNewline; Write-Host " - Is that correct?" -ForegroundColor White -BackgroundColor Black
		Write-Host ""
		Write-Host "[ Y / N ]"
		Write-Host ""
		Write-Host -nonewline "Please type your choice and press Enter: "
		$choiceC = Read-Host
		Write-Host ""
		       
		$ok = $choiceC -match '^[y]+$'
		       
		If ( -not $ok) {
			Write-Host ""
			Write-Host "Please type the user NTID again" -ForegroundColor Red -BackgroundColor Black
			Write-Host ""
			Start-Sleep -Seconds 3
			cls
			#Write-Host "Press any key to continue ..." -ForegroundColor Cyan
			#$x = $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
		}
	} Until ( $ok )
	cls
	Do {
		$username = Read-Host "What is the CompleteView username for the user in question?"
		Write-Host ""
		Write-Host "You have entered " -ForegroundColor White -BackgroundColor Black -NoNewline; Write-Host "$username" -ForegroundColor Yellow -BackgroundColor Black -NoNewline; Write-Host " - Is that correct?" -ForegroundColor White -BackgroundColor Black
		Write-Host ""
		Write-Host "[ Y / N ]"
		Write-Host ""
		Write-Host -nonewline "Please type your choice and press Enter: "
		$choiceD = Read-Host
		Write-Host ""
		       
		$ok = $choiceD -match '^[y]+$'
		       
		If ( -not $ok) {
			Write-Host ""
			Write-Host "Please type the CompleteView username again" -ForegroundColor Red -BackgroundColor Black
			Write-Host ""
			Start-Sleep -Seconds 3
			cls
			#Write-Host "Press any key to continue ..." -ForegroundColor Cyan
			#$x = $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
		}
	} Until ( $ok )
	cls
	$folder = "\\$computer\c$\Users\$ntid\AppData\Roaming\Salient Security Platform\CompleteView 2020\Desktop Client\$username"
	Remove-Item $folder -Recurse -ErrorAction Ignore
	# This allows the Remove-Item cmdlet to run and potentially error out (spelling error, directory doesn't exist, etc.) without upsetting or startling the end user
	Write-Host ""
	Write-Host "Your cached Desktop Client data should be cleared. Checking now!"
	Start-Sleep -Seconds 3
	cls
	Test-Path -Path $folder
	Write-Host ""
	Write-Host "If the above is FALSE, the AppData cache should be removed. Have the user re-attempt login." -ForegroundColor Black -BackgroundColor Green
	Write-Host ""
	Write-Host "If the above is TRUE, then the AppData cache may still exist and may require manual checking via RDP." -ForegroundColor Black -BackgroundColor Red
	Write-Host ""
	Write-Host "Do we have any more computers needing the AppData cache removed? [ Y / N ]"
	Write-Host ""
	Write-Host -nonewline "Please type your choice and press Enter: "
	$choiceA = Read-Host
	Write-Host ""

	$ok = $choiceA -match '^[n]+$'
	If ( -not $ok) {
		Write-Host ""
		Write-Host "Sure thing! Let's take care of the next user now." -ForegroundColor Red -BackgroundColor Black
		Write-Host ""
		Start-Sleep -Seconds 3
		cls
	}
} Until ( $ok )
cls
Write-Host ""
Write-Host "Perfect! It's been great working together; have a delightful day!"
Start-Sleep -Seconds 3
exit
exit