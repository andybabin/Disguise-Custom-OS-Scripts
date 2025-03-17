#d3 105

return @{
    hostName="d3-105"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.5.105'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            DNSIP='192.168.1.4'
            DNSIP2='192.168.1.5'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.10.105'
            NewName='B - d3 Net'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.70.105'
            NewName='C - Omnical'
        }
        'D - Media 100GBit' = @{
            StaticIP='192.168.40.105'
            NewName='D - Renderstream'
        }
        'E - Media 100GBit' = @{
            StaticIP='192.168.30.105'
            NewName='E - Content'
        }
    }
}