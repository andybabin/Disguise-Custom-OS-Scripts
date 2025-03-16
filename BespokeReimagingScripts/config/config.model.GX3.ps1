#this should work for a gx3 and a vx4p

return @{
    hostName="d3-Test-Name"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.101.85'
            NewName='AVNet_101_1Gb'
            GatewayIP='192.168.100.1'
            DNSIP='8.8.8.8'
            DNSIP2='75.75.75.75'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.104.85'
            NewName='AVNet_104_10Gb'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.103.85'
            NewName='AVNet_103_10Gb'
        }
    }
}