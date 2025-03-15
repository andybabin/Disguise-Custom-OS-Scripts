return @{
    hostName="d3-103"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.5.103'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            NSIP='192.168.5.1'
            DNSIP2='8.8.8.8'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.10.103'
            NewName='B - d3 Net'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.70.103'
            NewName='C - Omnical'
        }
        'D - Media 100GBit' = @{
            StaticIP='192.168.40.103'
            NewName='D - Renderstream'
        }
        'E - Media 100GBit' = @{
            StaticIP='192.168.30.103'
            NewName='E - Content'
        }
    }
}