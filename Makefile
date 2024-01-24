start-terraform:
	cd terraform && \
	terraform init  && \
	terraform apply


destroy-terraform:
	cd terraform  && \
	terraform destroy
