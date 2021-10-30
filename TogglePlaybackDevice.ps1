$playbackDevices = Get-AudioDevice -List | Where-Object {$_.Type -eq 'Playback'}
$currentDevice = Get-AudioDevice -Playback
$currentDeviceIndex = $playbackDevices.ForEach{$_.ID}.IndexOf($currentDevice.ID)
$nextDeviceIndex = ($currentDeviceIndex + 1) % $playbackDevices.Length
$nextDevice = $playbackDevices[$nextDeviceIndex]
Set-AudioDevice -ID $nextDevice.ID
