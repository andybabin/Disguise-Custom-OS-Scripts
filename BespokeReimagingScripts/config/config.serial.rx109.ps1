return @{
    hostName="rx-109"
    NetAdapterSettings=@{
        '1Gbit - 3'= @{
            StaticIP='192.168.5.129'
            NewName='A - Management'
            GatewayIP='192.168.5.1'
            NSIP='192.168.5.1'
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
            StaticIP='192.168.10.129'
            NewName='B - d3 Net'
        }
        '10Gbit - 2' = @{
            StaticIP='192.168.70.129'
            NewName='C - Omnical'
        }
        '25Gbit - 1' = @{
            StaticIP='192.168.40.129'
            NewName='E - Renderstream'
        }
        '25Gbit - 2' = @{
            StaticIP='192.168.30.129'
            NewName='F - Content'
        }
    }
}