module "loadtest" {

    source = "../../"
    #source  = "marcosborges/loadtest-distribuited/aws"
    #version = "1.0.0"

    name = "nome-da-implantacao"
    executor = "jmeter"
    loadtest_dir_source = "../plan/"
    nodes_size = 2
    
    loadtest_entrypoint = "jmeter -n -t jmeter/*.jmx  -R \"{NODES_IPS}\" -l /loadtest/logs -e -o /var/www/html/jmeter -Dnashorn.args=--no-deprecation-warning -Dserver.rmi.ssl.disable=true -Gjmeterengine.remote.system.exit=true -Ljmeter.engine=DEBUG  "

    ssh_export_pem = true
    subnet_id = data.aws_subnet.current.id
}

