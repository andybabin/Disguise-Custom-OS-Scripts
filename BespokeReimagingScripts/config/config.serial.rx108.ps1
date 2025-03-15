return @{
    hostName="rx-108"
    NetAdapterSettings=@{
        '1Gbit - 3'= @{
            StaticIP='192.168.5.128'
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
            StaticIP='192.168.10.128'
            NewName='B - d3 Net'
        }
        '10Gbit - 2' = @{
            StaticIP='192.168.70.128'
            NewName='C - Omnical'
        }
        '25Gbit - 1' = @{
            StaticIP='192.168.40.128'
            NewName='E - Renderstream'
        }
        '25Gbit - 2' = @{
            StaticIP='192.168.30.128'
            NewName='F - Content'
        }
    }
}