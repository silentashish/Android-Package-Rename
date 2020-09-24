# first define current value of the package name and future package name
$current_package_name = "check.edigitalnepal.brightangles.home"
$current_app_name = "brightAnglesNew"
$current_display_name = "brightAnglesNew"

$next_package_name = "check.edigitalnepal.brightangles.ssss"
$next_app_name = "brightsdjdhdhdhdh"
$next_display_name = "Uduuodo dhdhdhu djjdjjd"


# Before starting execution of command give some Message to user
Write-Host "This script is made to automate process of renaming package name in android app"
Write-Host "-------------------------------------------------------------------------------"
Write-Host "Action 1 : Renaming Android Package File File Name"

$mainPath = $current_package_name.Split('.')
$javaPath = "$($mainPath[0])/$($mainPath[1])/$($mainPath[2])/$($mainPath[3])"

$android_manifest_path = './android/app/src/main/AndroidManifest.xml'
$android_buck_path = './android/app/_BUCK'
$android_gradle_build_path = './android/app/build.gradle'
$main_activity_path = "./android/app/src/main/java/$($javaPath)/MainActivity.java"
$main_application_path = "./android/app/src/main/java/$($javaPath)/MainApplication.java"
$splash_screen_path = "./android/app/src/main/java/$($javaPath)/SplashActivity.java"

Write-Host "Changing package name from" $current_package_name 'to' $next_package_name

(Get-Content $android_manifest_path) -replace $current_package_name, $next_package_name | Set-Content -Path $android_manifest_path
(Get-Content $android_buck_path) -replace $current_package_name, $next_package_name | Set-Content -Path $android_buck_path
(Get-Content $android_gradle_build_path) -replace $current_package_name, $next_package_name | Set-Content -Path $android_gradle_build_path
(Get-Content $main_activity_path) -replace $current_package_name, $next_package_name | Set-Content -Path $main_activity_path
(Get-Content $main_application_path) -replace $current_package_name, $next_package_name | Set-Content -Path $main_application_path
(Get-Content $splash_screen_path) -replace $current_package_name, $next_package_name | Set-Content -Path $splash_screen_path



Write-Host "Action 2 : Renaming Android App Name"

$main_activity_path = "./android/app/src/main/java/$($javaPath)/MainActivity.java"
$app_json_path = "./app.json"
$setting_gradle_path = "./android/settings.gradle"
$package_path = './package.json'
$string_path = './android/app/src/main/res/values/strings.xml'

(Get-Content $main_activity_path) -replace $current_app_name, $next_app_name | Set-Content -Path $main_activity_path
(Get-Content $app_json_path) -replace $current_app_name, $next_app_name | Set-Content -Path $app_json_path
(Get-Content $setting_gradle_path) -replace $current_app_name, $next_app_name | Set-Content -Path $setting_gradle_path
(Get-Content $package_path) -replace $current_app_name, $next_app_name | Set-Content -Path $package_path
# (Get-Content $string_path) -replace $current_app_name, $next_app_name | Set-Content -Path $string_path

Write-Host "Action 3 : Renaming App Display Name"

$app_json_path = "./app.json"
$string_path = './android/app/src/main/res/values/strings.xml'

(Get-Content $app_json_path) -replace $current_display_name, $next_display_name | Set-Content -Path $app_json_path
(Get-Content $string_path) -replace $current_display_name, $next_display_name | Set-Content -Path $string_path

Write-Host "Action 4 : Changing Project Folder"
$nextmainPath = $next_package_name.Split('.')
$nextjavaPath = "$($nextmainPath[0])/$($nextmainPath[1])/$($nextmainPath[2])/$($nextmainPath[3])"

Write-Host "Done chaning Package Name"
Write-Host "Create New Folder" $nextjavaPath

New-Item -ItemType directory -Path "./android/app/src/main/java/$($nextjavaPath)"

Write-Host "Moving files to new directory"
Move-Item -Path "./android/app/src/main/java/$($javaPath)/*" -Destination "./android/app/src/main/java/$($nextjavaPath)"