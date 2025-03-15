return @{
    hostName="d3-204"
    NetAdapterSettings=@{
        'A - d3Net 1Gbit'= @{
            StaticIP='192.168.101.114'
            #NewName='AVNet_101_1Gb'
            #GatewayIP='192.168.100.1'
            #NSIP='8.8.8.8'
            #DNSIP2='75.75.75.75'
        }
        'B - Media 10GBit' = @{
            StaticIP='192.168.102.114'
            #NewName='AVNet_104_10Gb'
        }
        'C - Media 10GBit' = @{
            StaticIP='192.168.103.114'
            #NewName='AVNet_103_10Gb'
        }
    }
}