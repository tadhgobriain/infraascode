Param (
    # ProductID is a string of 25 alpha-numeric characters split into 5 sets of 5 characters, each separated by a hyphen
    [Parameter(Mandatory=$True)]
    [ValidatePattern("^([A-Z1-9]{5}-){4}[A-Z1-9]{5}$")]
    [String]$ProductID
 )

$UnattendXML =  Get-Item -Path '.\Base_Images\Packer_Templates\Answer_Files\Windows2016_64\Autounattend.XML'
$AutounattendXML = [xml](Get-Content $UnattendXML)
$NameSpace = @{ns = "urn:schemas-microsoft-com:unattend"}

($AutounattendXML | Select-Xml -XPath //ns:ProductKey -Namespace $NameSpace | Select-Object -ExpandProperty Node).Key = $ProductID

$AutounattendXML.Save($UnattendXML.Fullname)

packer build -force .\Base_Images\Packer_Templates\Builders\virtualbox\builder-win2016StdGUI_Imagine.json