$playbackDevices = Get-AudioDevice -List | Where-Object {$_.Type -eq 'Playback'}
$currentDevice = Get-AudioDevice -Playback
$currentDeviceIndex = $playbackDevices.ForEach{$_.Index}.IndexOf($currentDevice.Index)
$nextDeviceIndex = ($currentDeviceIndex + 1) % $playbackDevices.Length
$nextDevice = $playbackDevices[$nextDeviceIndex]
Set-AudioDevice -Index $nextDevice.Index