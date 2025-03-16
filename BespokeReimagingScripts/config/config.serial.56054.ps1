#rx 105

return @{
    hostName="rx-105"
    NetAdapterSettings=@{
        '1Gbit - 3'= @{
            StaticIP='192.168.5.125'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            DNSIP='192.168.5.1'
            DNSIP2='8.8.8.8'
        }
        '1Gbit - 4'= @{
            #StaticIP='192.168.5.101'
            #NewName='A - Management'
            #GatewayIP='192.168.5.1'
            #NSIP='192.168.5.1'
            #DNSIP2='8.8.8.8'
        }
        '10Gbit - 1' = @{
            StaticIP='192.168.10.125'
            NewName='B - d3 Net'
        }
        '10Gbit - 2' = @{
            StaticIP='192.168.70.125'
            NewName='C - Omnical'
        }
        'D - 25Gbit' = @{
            StaticIP='192.168.40.125'
            NewName='E - Renderstream'
        }
        'E - 25Gbit' = @{
            StaticIP='192.168.30.125'
            NewName='F - Content'
        }
    }
}