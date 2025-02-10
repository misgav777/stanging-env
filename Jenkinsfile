pipeline{
    agent any
    
    stages{
        stage("Initialize Terraform"){
            steps{
               sh 'terraform init' // Initialize Terraform
            }
        }

        stage("fmt Terraform"){
            steps{
                sh 'terraform fmt' // Format Terraform
            }
        }

        stage("Validate Terraform"){
            steps{
                sh 'terraform validate' // Validate Terraform
            }
        }

        stage("Plan Terraform"){
            steps{
                sh 'terraform plan' // Plan Terraform
            }
            input(message: "Do you want to continue?", ok: "Proceed") // Input to continue
        }

        stage("Apply/Destroy Terraform"){
            steps{
                sh "terraform $action -auto-approve" // Apply/Destroy Terraform
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}