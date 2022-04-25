import { Stack, StackProps } from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from "aws-cdk-lib/aws-ec2";
import * as ecs from "aws-cdk-lib/aws-ecs";
import * as ecr from "aws-cdk-lib/aws-ecr";
import * as route53 from "aws-cdk-lib/aws-route53";
import * as ecs_patterns from "aws-cdk-lib/aws-ecs-patterns";

export class InfrastructureStack extends Stack {
  
  static webserverRepo(scope: Construct): ecr.IRepository {
    return ecr.Repository.fromRepositoryName(scope, "Web Server Repository", "web_server");
  }

  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

    const vpc = new ec2.Vpc(this, "WebServerVpc", {
      maxAzs: 3 // Default is all AZs in region
    });
    
    const hostedZone = route53.HostedZone.fromHostedZoneAttributes(this, "Web Service Hosted Zone", {
      hostedZoneId: "Z0559263A77QETUPUWCL",
      zoneName: "jmhossler.net"
    });

    const cluster = new ecs.Cluster(this, "WebServer", {
      vpc: vpc
    });
    
    const webserver_repo = InfrastructureStack.webserverRepo(this);

    // Create a load-balanced Fargate service and make it public
    new ecs_patterns.ApplicationLoadBalancedFargateService(this, "WebServerService", {
      cluster: cluster, // Required
      cpu: 256, // Default is 256
      
      desiredCount: 1, // Default is 1
      taskImageOptions: { 
        image: ecs.ContainerImage.fromEcrRepository(webserver_repo, "0.0.1") ,
        environment: {
          "PORT": "4000",
          "EXTERNAL_PROTOCOL": "http",
          "EXTERNAL_PORT": "80",
          "EXTERNAL_HOSTNAME": "twitch.jmhossler.net",
          "SECRET_KEY_BASE": "uCT5v2kh27BkmIAMtVmKXUgXX4e60GQO2lXn0nQPoy8Zb7EpL65I/l1oKHmXF1fD"
        },
        containerPort: 4000,
        containerName: "web_server"
      },
      domainName: "twitch.jmhossler.net",
      domainZone: hostedZone,
      memoryLimitMiB: 512, // Default is 512
      publicLoadBalancer: true // Default is false
    });
  }
}
