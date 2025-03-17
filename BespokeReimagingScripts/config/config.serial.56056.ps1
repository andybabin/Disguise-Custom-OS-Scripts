#rx 102
return @{
    shouldUpdateDesktopWallpaper=$true
    shouldInstallRemotix=$true
    shouldInstallUnreal=$true

    hostName="rx-102"
    NetAdapterSettings=@{
        '1Gbit - 3'= @{
            StaticIP='192.168.5.122'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            DNSIP='192.168.1.4'
            DNSIP2='192.168.1.5'
        }
        '1Gbit - 4'= @{
            #StaticIP='192.168.5.101'
            #NewName='A - Management'
            #GatewayIP='192.168.5.1'
            #NSIP='192.168.5.1'
            #DNSIP2='8.8.8.8'
        }
        '10Gbit - 1' = @{
            StaticIP='192.168.10.122'
            NewName='B - d3 Net'
        }
        '10Gbit - 2' = @{
            StaticIP='192.168.70.122'
            NewName='C - Omnical'
        }
        'D - 25Gbit' = @{
            StaticIP='192.168.40.122'
            NewName='E - Renderstream'
        }
        'E - 25Gbit' = @{
            StaticIP='192.168.30.122'
            NewName='F - Content'
        }
    }
}