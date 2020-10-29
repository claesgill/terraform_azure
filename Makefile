all: rm ipa

ipa:
	terraform init
	terraform plan
	terraform apply -auto-approve

rm:
	rm -rf .terraform
	rm -rf terraform.*
	rm -rf .terraform.*