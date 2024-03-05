export fq=$(az network public-ip show -g testing -n jenkins-jnlp-vagrantPublicIP | jq -r '.ipAddress')
echo $fq
knife bootstrap vagrant@$fq --node-name jenkins-jnlp --ssh-identity-file ~/.ssh/id_rsa --yes --sudo
rsync -zavuh -e ssh ./cookbooks vagrant@$fq:~
ssh vagrant@$fq -i ~/.ssh/id_rsa "sudo mkdir -p /var/build"
rsync -zavuh -e ssh ./secrets.good vagrant@$fq:/var/build/secrets.json
ssh vagrant@$fq -i ~/.ssh/id_rsa "sudo chef-client -zr 'recipe[jenkins-jnlp]'"
