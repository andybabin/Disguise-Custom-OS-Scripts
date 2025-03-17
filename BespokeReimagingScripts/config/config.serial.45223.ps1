#d3 106

return @{
    hostName="d3-106"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.5.106'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            DNSIP='192.168.1.4'
            DNSIP2='192.168.1.5'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.10.106'
            NewName='B - d3 Net'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.70.106'
            NewName='C - Omnical'
        }
        'D - Media 100GBit' = @{
            StaticIP='192.168.40.106'
            NewName='D - Renderstream'
        }
        'E - Media 100GBit' = @{
            StaticIP='192.168.30.106'
            NewName='E - Content'
        }
    }
}