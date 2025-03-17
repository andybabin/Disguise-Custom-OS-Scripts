#d3 101

return @{
    hostName="d3-101"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.5.101'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            DNSIP='192.168.1.4'
            DNSIP2='192.168.1.5'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.10.102'
            NewName='B - d3 Net'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.70.101'
            NewName='C - Omnical'
        }
        'D - Media 100GBit' = @{
            StaticIP='192.168.40.101'
            NewName='D - Renderstream'
        }
        'E - Media 100GBit' = @{
            StaticIP='192.168.30.101'
            NewName='E - Content'
        }
    }
}