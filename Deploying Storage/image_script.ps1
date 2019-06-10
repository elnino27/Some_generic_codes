 #### Script for converting into image ####

 Add-AzureRmAccount
 Get-AzureRmSubscription
 $vmName = "SimplewinVM"
 $rgName = "firstdeploy"
 $location = "West Europe"
 $imageName = "simplevm_image"
 Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Force
 Set-AzureRmVM -ResourceGroupName  $rgName -Name $vmName -Generalized
 $vm = Get-AzureRmVM -ResourceGroupName  $rgName -Name $vmName
 $image=New-AzureRmImageConfig -Location $location -SourceVirtualMachineId $vm.Id
 New-AzureRmImage -Image $image -ImageName $imageName -ResourceGroupName $rgName