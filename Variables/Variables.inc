[Variables]
; -------------------------------------------------------------------------------
; VariablesDefault.inc should contain all or most of the variables required for the app's function, especially user settings.
; VariablesDefault.inc keys and values are the default settings when the app is first installed or reinstalled.
; Any settings changed by the user should be written to Variables.in, not VariablesDefault.inc.
; All keys in Variables.inc supercede the identical keys of VariablesDefault.inc. 
; VariablesDefault.inc acts as a backup and fallback.
; -------------------------------------------------------------------------------

; -------------------------------------------------------------------------------
; Below variables are required for the app's function. Do not remove or change.
; -------------------------------------------------------------------------------

MyAppID=VPN_Status-Mike_Boynton
MyAppName=VPN Status
MyAppAuthor=Mike Boynton
MyVariablesLoc=#SKINSPATH#Droptop Community Apps\Apps\VPN_Status-Mike_Boynton\Variables\Variables.inc

Location=https://ipwho.is/
;Location=https://ipinfo.io?token=7cf1f9c1908c52
Width=(245 * #DroptopSize#)
WorldWidth=(234 * #DroptopSize#)
WorldHeight=(120 * #DroptopSize#)
WorldLatitudeMin=(-86 * #DroptopSize#)
WorldLatitudeMax=(84 * #DroptopSize#)
WorldLongitudeMin=(-180 * #DroptopSize#)
WorldLongitudeMax=(180 * #DroptopSize#)

MaxDownloadMbits=293.78
MaxUploadMbits=10.05
; -------------------------------------------------------------------------------
; Add your variables below: 
; -------------------------------------------------------------------------------

VPNOnOff=0

CustomAppName=VPN Status
CustomAppVersion=0.9
CustomAppCreators=Mike Boynton


