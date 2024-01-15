module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"
  # depends_on = [ module.ec2_private,module.ec2_private,module.vpc, module.loadbalancer_sg]

  name               = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]

  ]
  security_groups = [module.loadbalancer_sg.security_group_id]

  # Listner  where we are REDIRECTING http(80) reqest to HTTPS(443)

  http_tcp_listeners = [
    {
      port     = 80
      protocol = "HTTP"
      # target_group_index = 0 # for single target i.e. 0
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  # Target Groups
  target_groups = [

    # app1 Target Group - TG Index = 0

    {
      name_prefix                       = "app1-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      # App1 target group - Targets
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private_app1["one"].id
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private_app1["two"].id
          port      = 80
        }
      }
      tags = local.common_tags # target group Tags
    },

    # App2 Target Group - where its index will be = 1


    {
      name_prefix                       = "app2-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"

      # App2 target group - Targets

      targets = {
        my_app2_vm1 = {
          target_id = module.ec2_private_app2["one"].id
          port      = 80
        },
        my_app2_vm2 = {
          target_id = module.ec2_private_app2["two"].id
          port      = 80
        }
      }

      tags = local.common_tags # target group Tags
    }
  ]

  # HTTPS Listner for HTTPS 443 port having index = 0

  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn

      # target_group_index = 1 # it means go to target group 1 when https request comes

      action_type = "fixed-response" 
      fixed_response = {
        content_type = "text/html"
        # message_body = "Hi there! to go to app1 go to  => deveshdevops.com/app1 <br>  for app2 go to => deveshdevops.com/app2 "
        message_body = "<!DOCTYPE html> <html> <body style='background-color:rgb(53, 157, 174);'> <h2>Hi there!</h2><br><h1> Welcome to DeveshDevOps</h1> <p>to go to APP1 go to  => <a href='/app1'> deveshdevops.com/app1</a> <br>  for APP2 go to =>  <a href='/app2'> deveshdevops.com/app2</a></p> <br></body></html>"
        status_code  = "200"
      }
    },
  ]

  # HTTPS Listner Rules

    https_listener_rules = [

    # RULE 1 :  /app1  i.e. it should go to app1 EC2 instance
    {
      https_listener_index = 0   /* # this is the index of the listner 'https_listners' 
                                  here we have given only 1 listner for its value will be 0 */

      actions = [
        {
          type = "forward"
          target_group_index = 0 # this will redirect to https_listners 0th index
        }
      ]

      conditions = [{
        path_patterns = ["/app1*"]
      }]
    },

    
    # RULE 2 :  /app2  i.e. it should go to app1 EC2 instance


    {
      https_listener_index = 0 
      actions = [
        {
          type = "forward"
          target_group_index = 1 # this will redirect to https_listners 1st index
        }
      ]

      conditions = [{
        path_patterns = ["/app2*"]
      }]
    }

  ]

  tags = local.common_tags

}
