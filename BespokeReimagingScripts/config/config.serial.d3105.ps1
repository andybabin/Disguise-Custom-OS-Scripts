return @{
    hostName="d3-105"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.5.105'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            NSIP='192.168.5.1'
            DNSIP2='8.8.8.8'
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