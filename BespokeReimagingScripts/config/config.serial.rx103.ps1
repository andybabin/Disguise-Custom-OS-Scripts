return @{
    hostName="rx-103"
    NetAdapterSettings=@{
        '1Gbit - 3'= @{
            StaticIP='192.168.5.123'
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
            StaticIP='192.168.10.123'
            NewName='B - d3 Net'
        }
        '10Gbit - 2' = @{
            StaticIP='192.168.70.123'
            NewName='C - Omnical'
        }
        '25Gbit - 1' = @{
            StaticIP='192.168.40.123'
            NewName='E - Renderstream'
        }
        '25Gbit - 2' = @{
            StaticIP='192.168.30.123'
            NewName='F - Content'
        }
    }
}